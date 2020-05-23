# README

* Ruby version: 2.6.6
* Rails version: 6.0.3.1
* 確認環境：
     OS：Windows 8 (64bit)
     ブラウザ：Google Chrome 81.0.4044.138

* 作成・利用するテーブル
   * users
   * photo_images

* 実行方法
   １．テーブルを作成
       $ rake db:migrate
   ２．ログインするためのユーザ・パスワードをDBに追加
       $ rails c
       irb(main):001:0> User.create(userid: "user", password: "password")
   ３．アプリ起動
       $ rails s
   ４．ブラウザでアクセス
       アクセス先： http://localhost:3000/