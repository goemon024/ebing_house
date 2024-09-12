import mysql.connector
# from google.oauth2 import service_account
# from googleapiclient.discovery import build
import os
import logging
import django
from pathlib import Path
from dotenv import load_dotenv
# from django.utils import timezone
from datetime import date,timedelta


load_dotenv()
IS_DOCKER = os.path.exists('/.dockerenv')
IS_HEROKU = os.getenv('DYNO') is not None

logging.basicConfig(
    filename='batch/batch_process.log',  # ログファイルの名前
    level=logging.INFO,            # ログレベルをINFOに設定
    format='%(asctime)s - %(levelname)s - %(message)s',  # ログのフォーマット
)

# MySQLに接続してデータを取得
def update_data_mysql(tbl,user_id1,user_id2):
    try:
        # MySQLに接続
        conn = mysql.connector.connect(
            host='db' if IS_DOCKER and IS_HEROKU else os.getenv('DB_HOST'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD'),
            database=os.getenv('DB_NAME')
        )
        cursor = conn.cursor()
        
        # 最新の日付を取得
        get_latest_query = f"SELECT MAX(reg_date) AS latest_date FROM {tbl} WHERE user_id = %s"
        cursor.execute(get_latest_query,(user_id2,))
        latest_date = cursor.fetchone()[0]
        add_date = date.today()-latest_date - timedelta(days=1)
        
        # Step 1: user_id1 のデータを削除
        delete_query = f"DELETE FROM {tbl} WHERE user_id = %s"
        cursor.execute(delete_query, (user_id1,))

        logging.info(f"User_id={user_id1} のデータを削除しました: {cursor.rowcount} 件")

        # Step 2: user_id1 のデータを複製し、user_id2 として挿入
        insert_query = f"""
            INSERT INTO {tbl} (word, mean1, mean2, reg_date, user_id)
            SELECT word, mean1, mean2, reg_date, %s FROM {tbl} WHERE user_id = %s
        """
        cursor.execute(insert_query, (user_id1, user_id2))
        
        # Step 3: 最新の日付が前日となるようにずらす
        change_date_query = f"""
            UPDATE {tbl} SET reg_date = DATE_ADD(reg_date, INTERVAL %s DAY)
            WHERE user_id = %s
        """
        cursor.execute(change_date_query, (add_date.days, user_id1))
        
        conn.commit()
        logging.info(f"User_id={user_id1} のデータを user_id={user_id2} から複製しました: {cursor.rowcount} 件")
    
    except mysql.connector.Error as err:
        conn.rollback()  # ロールバック
        logging.error(f"MySQLエラーが発生しました: {err}")
    
    except Exception as e:
        conn.rollback()  # ロールバック
        logging.error(f"予期しないエラーが発生しました: {e}")
    
    except Exception as e:
        conn.rollback()  # ロールバック
        logging.error(f"予期しないエラーが発生しました: {e}")
    finally:
        # カーソルと接続をクローズ
        if cursor:
            cursor.close()
        if conn:
            conn.close()




# Google Sheetsにデータを書き込む
def write_to_google_sheets(data):
    SCOPES = ['https://www.googleapis.com/auth/spreadsheets']
    SERVICE_ACCOUNT_FILE = 'path/to/your-service-account.json'

    credentials = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)

    service = build('sheets', 'v4', credentials=credentials)

    SPREADSHEET_ID = 'your-spreadsheet-id'
    RANGE_NAME = 'Sheet1!A1:D5'

    # Google Sheetsに書き込むデータを整形
    values = [list(row) for row in data]
    body = {
        'values': values
    }

    result = service.spreadsheets().values().update(
        spreadsheetId=SPREADSHEET_ID, range=RANGE_NAME,
        valueInputOption="RAW", body=body).execute()

    print(f"{result.get('updatedCells')} cells updated.")

# メイン処理
if __name__ == '__main__':
    tbl = os.getenv('BATCH_CHECK_TABLE')
    user_id1 = "7"
    user_id2 = "6"
    update_data_mysql(tbl,user_id1,user_id2)
    # write_to_google_sheets(data)
    # print(data)