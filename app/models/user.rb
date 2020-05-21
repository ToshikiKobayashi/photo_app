class User < ApplicationRecord
  validates :userid, presence: true
  validates :password, presence: true
end
