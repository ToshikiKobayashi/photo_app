# README

* Ruby version: 2.6.6
* Rails version: 6.0.3.1
* 確認環境：
   * OS：Windows 8 (64bit)
   * ブラウザ：Google Chrome 81.0.4044.138

* 作成・利用するテーブル
   * users           : Webアカウントユーザ情報
   * photo_images    : 画像ファイル情報
   * oauth_certifier : OAuth認証情報

* 実行方法
   * 事前準備
       * $ bundle install
       * $ yarn install --check-files
   1. テーブルを作成
       * $ rake db:migrate
   2. ログインするためのWebのユーザ・パスワード、OAuthの認証情報をDBに追加
       * $ rails c
       * irb(main):001:0> User.create(userid: "user", password: "password")
       * irb(main):002:0> OauthCertifier.create(userid: "user", client_id: "<配布されたclient_id>", client_secret: "<配布されたclient_secret>", redirect_uri: "<配布されたredirect_uri>")  
                          → useridは、Webサーバアカウントとして作成したuseridと紐づけをします。
   3. アプリ起動
       * $ rails s
   4. ブラウザでアクセス
       * アクセス先： http://localhost:3000/
