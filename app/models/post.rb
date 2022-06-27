class Post < ApplicationRecord
  belongs_to :administrator, foreign_key: :admin_id
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true

  def created_by
    administrator.email
  end
end
