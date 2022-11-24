# liff-project

liff アプリの環境構築

# はじめに

以下のツールを事前にインストールしてください

- Docker

## 開発の手順

ルートディレクトリで、下記コマンドを実行してください

```
docker compose build
```

ビルドが完了したら、下記コマンドで Docker コンテナを起動してください

```
docker compose up -d
```

コンテナを起動したら、下記コマンドでコンテナにアクセスしてください

```
docker compose exec front bash
```

コンテナにアクセスしたら、下記操作により.envファイルを作成し、開発サーバーを起動してください

```
cd my-app/
cp .env.example .env
yarn install
yarn dev
```

ウェブで http://localhost:5173 にアクセスし、「create-liff-app」と表示されていれば起動成功です。

.envにLIFFIDが設定されていない場合、create-liff-appの下に、LIFF init failed.と表示されます。

その場合は、LINE Developers よりチャネルを作成し、LIFFIDを取得してください。

上記で取得したLIFFIDを、.envのVITE_LIFF_IDに設定することでエラーが解消されます。

LIFFIDが正しく設定された場合、create-liff-appの下に、LIFF init succeeded.と表示されます。