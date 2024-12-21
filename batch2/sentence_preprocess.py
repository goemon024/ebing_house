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
def generate_sentence_record(tbl1,tbl2,username):
    
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
        
        # fusenでtrueを選択
        default_list1= []
        query1 = f"""SELECT word,id,user_id FROM {tbl1} WHERE fusen = 1 and user_id={username}"""                
        cursor.execute(query1)
        records1 = cursor.fetchall()
        for row in records1:
            default_list1.append(row)
            
        default_list2= []
        query2 = f"""SELECT word,source_id,user_id FROM {tbl2} WHERE user_id={username}"""                
        cursor.execute(query2)
        records2 = cursor.fetchall()
        for row in records2:
            default_list2.append(row)
            
        add_record_list = list(set(default_list1) - set(default_list2))
        for row in add_record_list:
            query3 = f"""INSERT INTO {tbl2} (word, source_id, user_id, created_at) 
             VALUES (%s, %s, %s, %s)"""
            cursor.execute(query3, (row[0], row[1], row[2], datetime.now()))
            print(row[0],row[1])
            
            
        # for wd in default_list:
        #     query2 = f"""UPDATE {tbl} SET img = 'images/{wd}.webp' WHERE word = '{wd}'"""
        #     cursor.execute(query2)

        # # nullを変更
        # null_list = []
        # query3 = f"""SELECT word FROM  {tbl} WHERE img IS NULL"""
                
        # cursor.execute(query3)
        # records = cursor.fetchall()

        # for row in records:
        #     null_list.append(row[0])
        # print(len(null_list))
            
        # for wd in null_list:
        #     query4 = f"""UPDATE {tbl} SET img = 'images/{wd}.webp' WHERE word = '{wd}'"""
        #     cursor.execute(query4)


        conn.commit()
        logging.info("development test")
    
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
    
    tbl1 = os.getenv('BATCH_CHECK_TABLE1')
    tbl2 = 'wlist_listsentencemodel'
    username="12"

    generate_sentence_record(tbl1,tbl2,username)