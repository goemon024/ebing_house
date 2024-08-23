# ベースイメージとしてPython 3.10.12を使用
FROM python:3.10.12
ENV PYTHONUNBUFFERED 1  

# 作業ディレクトリを作成
WORKDIR /wm_docker

# システムのパッケージをアップデート
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     default-libmysqlclient-dev \
#     python3-dev \
#     pkg-config \
#     curl \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# 必要なPythonパッケージをインストールするためのrequirements.txtをコピー
COPY requirements.txt /wm_docker/

# pipをアップグレードし、requirements.txtに基づいて依存関係をインストール
RUN pip install --upgrade pip setuptools wheel \
    && pip install -r requirements.txt
    # && pip install --no-cache-dir -r requirements.txt



# アプリケーションのソースコードをコンテナにコピー
COPY . /wm_docker

# 静的ファイルを収集（Djangoの設定に応じて必要）
RUN python manage.py collectstatic --noinput

# ポート8000でアプリケーションを公開 ドキュメント的表示。
EXPOSE 8000

# コンテナ起動時に実行されるコマンド
# ENV PORT 8000
# CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "config.wsgi:application"]
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT:-8000} config.wsgi:application"]



# FROM python:3.10.12
# ENV PYTHONUNBUFFERED 1   
# RUN mkdir /code          
# WORKDIR /code            
# COPY requirements.txt /code/   
# RUN pip install --upgrade pip && pip install -r requirements.txt
#           # pipコマンドを最新にし、txtファイル内のパッケージ（後述）をpipインストール
# COPY . /code/