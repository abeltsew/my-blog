class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  before_save :update_post_counter

  scope :get_5_comments, ->(post) { post.comments.order('created_at DESC').limit(5) }

  validates :title, presence: true
  validates :author, presence: true

  validates :comment_counter, numericality: { greater_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_or_equal_to: 0 }

  def update_post_counter
    poster = User.find_by_id(author.id)
    poster.posts_counter = poster.posts_counter.to_i + 1
    poster.save
  end
end
