class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :comment
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
end
