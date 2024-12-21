import mysql.connector
import os
import logging
import django
from pathlib import Path
from dotenv import load_dotenv
from datetime import date,timedelta,datetime
from urllib.parse import urlparse
import random

from openai import OpenAI

logging.basicConfig(
    filename='batch2/batch_process.log',  # ログファイルの名前
    level=logging.INFO,            # ログレベルをINFOに設定
    format='%(asctime)s - %(levelname)s - %(message)s',  # ログのフォーマット
)


def eibun_sentence(word,word_list):

    client = OpenAI(api_key=os.getenv('OPEN_AI_KEY'))
    
    completion = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "developer", "content": "あなたは腕利きの大学受験英語の先生です。"},
        {
            "role": "user",
            "content": f"""下記の条件に従って、英単語'{word}'を必ず含み、大学受験生に有意義で具体的な表現で自然に解釈できる英語例文を作成してください。
                           1.英語例文は、単語リスト'{word_list}'の英単語をなるべく多く使用してください。
                           2.英語例文の単語数は、15単語以下にしてください。
                           3.英語例文の単語数は、8単語以上にしてください。
                           4.英単語{word}には()をつけて明示してください。"""
        }],
                            #    1.英語例文は、自然な解釈性が失われないようにしつつ、単語リスト'{word_list}'の英単語をなるべく多く使用してください。    
        max_tokens=30, 
        temperature=0)
    example_sentence = completion.choices[0].message.content
    return example_sentence

def wabun_sentence(sentence):

    client = OpenAI(api_key=os.getenv('OPEN_AI_KEY'))
    
    completion = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "developer", "content": "あなたは腕利きの大学受験英語の先生です。"},
        {
            "role": "user",
            "content": f"""英語例文'{sentence}'を、下記の条件にしたがって大学受験生に有意義で具体的な表現で和訳してください。
                           1.英語例文内の（）は残す。（）の中身は和訳する。
                           2.和訳した結果のみを表示。
                           3.SQL構文上で解釈される特殊文字を含めない。
                           """
        }],
        max_tokens=40, 
        temperature=0)
    example_sentence = completion.choices[0].message.content
    return example_sentence

def check_sentence(sentence):

    client = OpenAI(api_key=os.getenv('OPEN_AI_KEY'))
    
    completion = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "developer", "content": "あなたは腕利きの大学受験英語の先生です。"},
        {
            "role": "user",
            "content": f"""英語例文'{sentence}'が、大学受験英語として自然な表現になっているかどうかを下記の基準で評価してください。
                           1.文法上、表現上の大きな問題がないときは'OK'の文字列のみを表示する。
                           2.文脈も考慮すれば理解できるが不自然な表現になっているときは'MINOR'の文字列のみを表示する。
                           3.看過できない不自然な表現を有して、受験生を誤った知識を植え付ける可能性がある場合には'ALERT'の文字列のみを表示する。
                           """

            # "content": f"""英語例文'{sentence}'が、大学受験英語として自然な表現になっているかどうかを評価し、下記の条件にしたがって出力してください。
            #                1.文脈も考慮して概ね自然な表現になっているときは'OK'の文字列のみを表示する。
            #                2.看過できない不自然な表現を有しているときは'ALERT'の文字列のみを表示する。
            #                """
        }],
        max_tokens=20, 
        temperature=0)
    check_result = completion.choices[0].message.content
    return check_result

def evolve_sentence(word,sentence):

    client = OpenAI(api_key=os.getenv('OPEN_AI_KEY'))
    
    completion = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "developer", "content": "あなたは腕利きの大学受験英語の先生です。"},
        {
            "role": "user",
            "content": f"""下記の条件に従って、英語例文'{sentence}'の表現を改善して、大学受験生にとって自然で有意義な表現にしてください。
                           1.{word}の単語を使用し、{word}に()を付けてしてください。
                           2.改善した英語例文のみを出力する。
                           """
        }],
        max_tokens=20, 
        temperature=0)
    check_result = completion.choices[0].message.content
    return check_result


# MySQLに接続してデータを取得
def generate_sentence(tbl1,tbl2,username):
    
    load_dotenv()
    IS_DOCKER = os.path.exists('/.dockerenv')
    IS_HEROKU = os.getenv('DYNO') is not None
    
    # OpenAI.api_key = os.getenv('OPEN_AI_KEY')
    
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
        
        # get_word_list 現在のフセン状況に基づいて英文生成時に追加利用する単語を選択する。
        word_list = []
        query1 = f"""SELECT word FROM {tbl1} WHERE fusen=1 and user_id={username}"""                
        cursor.execute(query1)
        records1 = cursor.fetchall()
        for row in records1:
            word_list.append(row[0])
            
        print(word_list)
        print(len(word_list))
        
        # listsentenceモデルでeibunがないものを更新する。update_listの取得。
        # wordのみを出力させる（wordの重複を許容する）。
        generate_list = []
        query2 = f"""SELECT word FROM {tbl2} WHERE eibun IS NULL AND user_id= %s """
        cursor.execute(query2,(username,))
        update_records = cursor.fetchall()
        
        for row in update_records:
            generate_list.append(row[0])
        
        print(generate_list)
        print(len(generate_list))
        
        # update_listに基づいて、英語例文を生成＆記録
        i=0
        for word in generate_list:

            # とりあえずランダムに25個使う。
            if len(word_list)>25:
                use_list = random.sample(word_list, 25)
            else:
                use_list = word_list

            eibun_output = eibun_sentence(word,use_list)
            # eibun_output = evolve_sentence(word,eibun_output)            

            check_result = check_sentence(eibun_output)            
            wabun_output = wabun_sentence(eibun_output)

            print(check_result)
            print(eibun_output)
            print(wabun_output)

            query3 = f"""UPDATE {tbl2} set eibun= %s, wayaku=%s, eval=%s WHERE word= %s and user_id= %s """
            cursor.execute(query3,(eibun_output, wabun_output,check_result,word, username))

            # query4 = f"""SELECT eibun from {tbl2} WHERE word= %s and user_id= %s """
            # cursor.execute(query4,(word,username))
            # result = cursor.fetchall()
            
            # i = i + 1
            # if i > 15:
            #     break

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

    generate_sentence(tbl1,tbl2,username)