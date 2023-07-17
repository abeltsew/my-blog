class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  before_save -> { User.find_by(id: author.id).increment!(:posts_counter) }

  scope :get_5_comments, ->(post) { post.comments.order('created_at DESC').limit(5) }

  validates :title, presence: true
  validates :author, presence: true
  validates :title, length: { in: 1..250 }
  validates :likes_counter, :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
