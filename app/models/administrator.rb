class Administrator < ApplicationRecord
  self.table_name = :admins

  validates :email, presence: true

  has_many :posts, foreign_key: :admin_id
end
