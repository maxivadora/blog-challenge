class Administrator < ApplicationRecord
  self.table_name = :admins

  validates :email, presence: true
end
