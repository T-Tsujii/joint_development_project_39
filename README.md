# 共同開発 基礎

共同開発（基礎）へようこそ！

## アプリのサンプル

共同開発（基礎）で作成するアプリのサンプルはこちらです。

- [https://joint-development-project.herokuapp.com/users](https://joint-development-project.herokuapp.com/users)

## 開発環境

- Ruby 2.6.6
- Rails 6.0.3.4
- PostgreSQL

Rails, PostgreSQLの環境構築が済まされていることが前提となります。まだの方は，逆転教材を参考に環境構築をお願いいたします。

- [動画教材](https://arcane-gorge-21903.herokuapp.com/?page=2)
- [テキスト教材](https://arcane-gorge-21903.herokuapp.com/texts)

## 1. 開発準備

共同開発（基礎）で作成するアプリは，「ユーザー・メッセージ・タスク」の3つの CRUD で実装できます。

3名で1つずつ担当していただきます。まずは，以下の手順で準備を行って下さい。

- ターミナルを開き，アプリを作成するディレクトリまで`cd`コマンドで移動
  - 【注意】Rails課題同様，「共同開発課題のディレクトリ内」に作成しないようにして下さい

- このGitHubリポジトリをクローン

```bash
git clone リポジトリURL
```

- 作成したRailsアプリのディレクトリに`cd`コマンドで移動

- gem をアプリ内にインストールする設定を行った上で `bundle install` を実行

```bash
bundle config set path vendor/bundle --local
bundle install
```

- 次のコマンドで `package.json` にリスト化されている全ての依存関係を `node_modules` 内にインストール
  - `Rails 6` のアプリをクローンした場合は必須です

```
yarn install --check-files
```

- データベースを作成

```bash
bin/rails db:create
```

- ブランチを切る
  - 担当タスクに応じたものを1つだけ選んで実行して下さい

```bash
git checkout -b feature/crud-for-users
git checkout -b feature/crud-for-messages
git checkout -b feature/crud-for-tasks
```

これで，開発準備が完了です。

なお，クローンをした時点で `.git` ディレクトリが作成され，`origin` が設定されております。次のコマンドは***不要***です。

```bash
# 次は実行不要
git init
git remote add origin リポジトリURL
```

## 2. 実装

- テキスト教材「resources を使ったCRUD処理の実装」を参考に，担当箇所の CRUD 処理を全て実装して下さい。
  - 「メッセージ」が担当ならば，「メッセージ」の新規投稿・一覧表示・詳細表示・編集・削除機能を全て実装して下さい

- この共同開発（基礎）では，コミットのタイミングを指定させていただきます。次のタイミングで***計7回***コミットを行って下さい。
  - プッシュは最後に1回行うだけでOKです
  - 事情により回数が増減した場合は，レビュー依頼時にその旨を報告して下さい。

1. `rails g model` コマンドで「マイグレーションファイル」と「モデル」を作成し，マイグレーションファイルに必要なカラムを追加し，マイグレーションを行う
2. `rails g controller` コマンドで「コントローラ」を作成し，ルーティングを`resources`で定義
3. 新規投稿機能 `new, create` を実装（ストロングパラメータを利用）
4. 一覧表示機能 `index` を実装（【注意】サンプルアプリのように1つのカラムのみ表示して下さい）
5. 詳細表示機能 `show` を実装（【注意】こちらは両方のカラムを表示するようにして下さい）
6. 編集機能 `edit, update` を実装
7. 削除機能 `destroy` を実装

- コミットメッセージは履歴が残ります。「変更内容がおおよそ分かる」ように書きましょう。日本語でOKです。

## 3. 実装完了後

- GitHubにプッシュ

```bash
git push origin HEAD
```

- プルリクを出す
  - プルリクを出す際，「タイトル」と「概要」を書くようにして下さい。日本語でOKです。
  - 「概要」ではサンプル定型文に沿って記載して下さい。Markdown形式で記述できます。不要な文言は削除して下さい。
  - コードの差分（変更内容）は GitHubから確認できます。コードレベルの実装内容を書くのではなく，何を実装したかが伝わりやすいようにまとめましょう。
  - 「レビューをお願いします」などはGitHubに書かないこと

- Slackにレビュー依頼のメッセージを投稿
  - 必ず，プルリクのURLを貼るようにして下さい
  - URLは `Conversation` の方を貼り付けて下さい。差分 `Files changed` の方を貼らないようにして下さい。

【注意】「コンフリクト」が出ていないか必ず確認をして下さい。コンフリクトが出ている場合は，解消をしてからレビュー依頼して下さい。

ページの一番下に次のような表示が出ていれば，コンフリクトが起きています。

```
This branch has conflicts that must be resolved

Conflicting files

config/routes.rb
db/schema.rb
```

## 4. コンフリクトの解消手順

### 4.0 コンフリクトとは

マージした際，同じ箇所が変更されているときに起こるのが「コンフリクト（競合）」です。

【例】

1行目に「おはよう」と書かれている「sample.txt」があるとします。

AさんとBさんがブランチを切り，共同開発を行うとします。

- Aさんは「おはよう」を「こんにちは」に変更

- Bさんは「おはよう」を「こんばんは」に変更

このとき，Aさんが master ブランチをマージした後，Bさんがマージした場合，Gitは「おはよう」を「こんにちは」にすべきか「こんばんは」にすべきかが分かりません。

そのため「コンフリクト」が起こります。

### 4.1 コンフリクトが起きているかどうかの確認

共同開発（基礎）でコンフリクトが起こる可能性があるのは，次の2つのファイルです。

- `config/routes.rb`
- `db/schema.rb`

【注意】コンフリクトの解消は，**GitHubから行わないで下さい**。以下の手順で解消して下さい。

### 4.2 ローカルで master ブランチをマージ

（コミットがまだであれば，先に行ってください）

```bash
# 現在のブランチが作業ブランチになっているか確認

git branch

# フェッチ（リモートブランチを取り込む）

git fetch

# リモートの master ブランチをマージ

git merge origin/master
```

### 4.3 コンフリクトの確認

`git status` を実行した際に， `both added: ファイル名`と書かれているファイルがコンフリクトしています

コンフリクトが起きているファイルをエディタで開きましょう。

`<<<<<<<`, `=======`, `>>>>>>>`が追加されている箇所でコンフリクトしています。

master ブランチをマージした場合は，`======`の下側が元の内容です。それに自分の変更を加えるのが原則です。

（単純に「両方残せばよい」「片方を削ればよい」という話ではありません）

### 4.4 コンフリクトの解消

- `config/routes.rb`

両方残すように修正しましょう。`<<<<<<<`, `=======` などが含まれる行は削除しましょう。

- `db/schema.rb`

このファイルは，マイグレーションを行った際に自動的に編集されるファイルです。エディタで直接編集するのは望ましくありません。コマンドで対応しましょう。

```
# データベースを作成し直し，マイグレーションを実行
# データベースのデータが全て消えますので，一般にはマイグレーションを理解した対応が必要です
rails db:migrate:reset
```

### 4.5 マージを完了させる

- `git diff` で差分を確認
  - `<<<<<<<`, `=======`などが残っていないか確認

- サーバーを起動して動作確認を行う

- コンフリクトの解消後，コミットを行う必要があります。その後，プッシュしましょう。

```
git add .
git commit

# vimが起動します。コミットメッセージはデフォルトでよいので，shiftキーを押しながら「z」を2回

git push origin HEAD
```

## 5. レビュー後の修正手順

- 該当箇所をエディタで修正

- コミット・プッシュ
  - 何をどう修正したのかが分かるようにコミットメッセージを書きましょう。「修正」のようないい加減なメッセージを書かないこと。

- Slackにレビュー依頼のメッセージを投稿
  - 必ず，プルリクのURLを貼るようにして下さい
  - 前回のプルリクをそのまま使用できます。プルリクを新しく出さないで下さい。

## 6. アプリ完成後

全員のタスクが完了し，アプリが完成したらマージして動作確認をしましょう。

```bash
git checkout master
git pull origin HEAD
rails db:migrate
rails s
```

これで共同開発（基礎）は完了です。お疲れさまでした！