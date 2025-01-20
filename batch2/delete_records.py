import mysql.connector
import os
import logging
import django
from pathlib import Path
from dotenv import load_dotenv
from datetime import date,timedelta,datetime
from urllib.parse import urlparse


logging.basicConfig(
    filename='batch2/batch_process.log',  # ログファイルの名前
    level=logging.INFO,            # ログレベルをINFOに設定
    format='%(asctime)s - %(levelname)s - %(message)s',  # ログのフォーマット
)

# MySQLに接続してデータを取得
def delete_sentence_record(tbl2,username):
    
    load_dotenv()
    IS_DOCKER = os.path.exists('/.dockerenv')
    IS_HEROKU = os.getenv('DYNO') is not None
    
    try:
        # MySQLに接続
        host='db' if IS_DOCKER and IS_HEROKU else os.getenv('DB_HOST')
        user=os.getenv('DB_USER')
        password=os.getenv('DB_PASSWORD')
        database=os.getenv('DB_NAME')

        DATABASE_URL = os.getenv('JAWSDB_URL')
        if DATABASE_URL:
            url = urlparse(DATABASE_URL)
            host = url.hostname       
            user = url.username       
            password = url.password   
            database = url.path[1:]
  
        conn = mysql.connector.connect(host=host,user=user,
                                       password=password,database=database)      
        cursor = conn.cursor()
        
        query2 = f"""DELETE FROM {tbl2} WHERE user_id={username}"""                
        cursor.execute(query2)

        conn.commit()
        logging.info(f'DELETE user_id={username} data form {tbl2}')
    
    except mysql.connector.Error as err:
        conn.rollback()  # ロールバック
        logging.error(f"MySQLエラーが発生しました: {err}")
        print(f"MySQLエラーが発生しました: {err}")
    
    except Exception as e:
        conn.rollback()  # ロールバック
        logging.error(f"予期しないエラーが発生しました: {e}")
        print(f"予期しないエラーが発生しました: {e}")
    
    except Exception as e:
        conn.rollback()  # ロールバック
        logging.error(f"予期しないエラーが発生しました: {e}")
        print(f"予期しないエラーが発生しました: {e}")
    
    finally:
        # カーソルと接続をクローズ
        if cursor:
            cursor.close()
        if conn:
            conn.close()
            
    # return word_list

# メイン処理
if __name__ == '__main__':
    load_dotenv()
    
    # tbl1 = os.getenv('BATCH_CHECK_TABLE1')
    tbl2 = 'wlist_listsentencemodel'
    username="12"

    delete_sentence_record(tbl2,username)