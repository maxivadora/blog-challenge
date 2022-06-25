class Comment < ApplicationRecord
  belongs_to :post

  validates :text, :email, presence: true
end
