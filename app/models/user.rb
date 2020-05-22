class User < ApplicationRecord
  validates :userid, presence: {message: "ユーザIDを入力してください"}
  validates :password, presence: {message: "パスワードを入力してください"}
end
