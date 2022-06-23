class Post < ApplicationRecord
  belongs_to :administrator, foreign_key: :admin_id

  validates :title, :content, presence: true
end
