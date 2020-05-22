class PhotoImage < ApplicationRecord
  validates :title, presence: {message: "タイトルを入力してください"}, length: { maximum: 30, message: "タイトルは30文字以内です"}
end
