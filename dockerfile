# ベースイメージとしてPython 3.10.12を使用
FROM python:3.10.12-slim-buster

# 作業ディレクトリを作成
WORKDIR /wm_docker

# システムのパッケージをアップデート
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 必要なPythonパッケージをインストールするためのrequirements.txtをコピー
COPY requirements.txt /wm_docker/

# pipをアップグレードし、requirements.txtに基づいて依存関係をインストール
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# アプリケーションのソースコードをコンテナにコピー
COPY . /wm_docker

# 静的ファイルを収集（Djangoの設定に応じて必要）
RUN python manage.py collectstatic --noinput

# ポート8000でアプリケーションを公開 ドキュメント的表示。
EXPOSE 8000

# コンテナ起動時に実行されるコマンド
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]
