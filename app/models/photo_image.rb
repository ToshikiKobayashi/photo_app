class PhotoImage < ApplicationRecord
  validates :filename, presence: true, length: { maximum: 30 }
end
