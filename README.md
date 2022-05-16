# アプリケーション名
Kiite
# アプリケーション概要
お悩み相談をしたい人と話を聞いてあげたい人がマッチングしてメッセージのやりとりができる。
# URL
https://kiite-proto1.herokuapp.com/

Basic認証ID:admin

Basic認証パスワード:2222
# 利用方法
### プロフィール登録
トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う。

プロフィール登録ボタンから、プロフィールの内容(画像、ニックネーム、コメント、自己紹介などの自由記載欄、SNSのURL、タグ)を入力し登録する。
### メッセージを送る
詳細ページにあるメッセージを送るボタンをクリックすると、そのユーザーとのチャットルームに遷移し、メッセージを送ることができる。
### お気に入り登録
気になるユーザーや相談してよかったと思うユーザーを詳細ページからお気に入り登録できる。

お気に入りユーザーは自身の詳細ページに一覧表示される。
### タグ検索
詳細ページのタグをクリックすると、そのタグがつけられたユーザーのプロフィールが一覧表示される。
# アプリケーションを作成した背景
以前から悩みを溜め込み過ぎてしまった人が起こした事件や自殺のニュースを見ると漠然と自分に何かできないかと感じていました。

そこで、その人たちには気軽に相談できる人や場所がなかったのではないかと考え、悩みを相談できる人と相談する場所を提供し、匿名でやりとりできるお悩み相談専門のプラットフォームを開発することにしました。
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1Z_ueupfAPgWTlxwaK_5CLJVG6C9yIOeUiSsVXKmHSqQ/edit?usp=sharing
# 実装した機能
### プロフィール登録
[![Image from Gyazo](https://i.gyazo.com/ff176fb2043d0a91e1f17295239af56f.gif)](https://gyazo.com/ff176fb2043d0a91e1f17295239af56f)
登録フォームから画像、ニックネーム、コメント、自由記載欄、SNSのURL、タグを登録できる。(ニックネーム以外は任意)
### メッセージ送信
[![Image from Gyazo](https://i.gyazo.com/d6484d669d921cee161bed0094b9e65e.gif)](https://gyazo.com/d6484d669d921cee161bed0094b9e65e)
プロフィール詳細ページのメッセージを送るボタンからチャットルームに遷移し、メッセージを送信できる。
### お気に入り追加
[![Image from Gyazo](https://i.gyazo.com/5272a72cd62ae68849da719b78b9071d.gif)](https://gyazo.com/5272a72cd62ae68849da719b78b9071d)
プロフィール詳細ページでお気に入りに追加すると、マイプロフィールにお気に入りユーザーが表示される。
### タグ検索
[![Image from Gyazo](https://i.gyazo.com/3633faa9bba8a40e3627938368672b2c.gif)](https://gyazo.com/3633faa9bba8a40e3627938368672b2c)
タグをクリックすると、そのタグがついたユーザーが一覧表示される。
# 実装予定の機能
相談を聞いてくれたユーザーを５段階で評価する機能を実装し、トップページに評価４以上のユーザーを評価の高いユーザーとして一覧表示する。

通話機能を実装し、メッセージだけでなく通話でお悩み相談できるようにする。

アプリ内課金アイテム「ギフト」を発行し、ユーザー間での贈与ができるようにする。ギフトは換金が可能。
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/56f58a7d50e5eb0ecdd18e851a6daf4e.png)](https://gyazo.com/56f58a7d50e5eb0ecdd18e851a6daf4e)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/dfa90d5371ac8aa15c25edd1fabcb0cd.png)](https://gyazo.com/dfa90d5371ac8aa15c25edd1fabcb0cd)
# 開発環境
フロントエンド

バックエンド

テスト

テキストエディタ

タスク管理
# ローカルでの動作方法
以下のコマンドを順に実行

% git clone https://github.com/kiite-proto1

% cd kiite-proto1

% bindle install

% yarn install
