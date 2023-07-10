class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :posts, through: :likes, foreign_key: :author_id
  has_many :posts, through: :comments, foreign_key: :author_id

  scope :three_recent_posts, ->(user) { user.posts.order('created_at desc').limit(3) }
end
