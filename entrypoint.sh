#!/bin/bash

# MySQLサーバーをバックグラウンドで起動
service mysql start

# MySQLでデータベースとユーザーを作成（必要に応じてスキップ可能）
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wm_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root -e "CREATE USER IF NOT EXISTS 'user1'@'localhost' IDENTIFIED BY 'hf&das$_yuicnbf31&fsaadd';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wm_db.* TO 'user1'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Djangoのマイグレーションを実行し、アプリケーションをGunicornで起動
python manage.py migrate
gunicorn --bind 0.0.0.0:${PORT:-8000} config.wsgi:application