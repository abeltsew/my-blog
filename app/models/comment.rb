class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  after_save :update_comment_counter

  def update_comment_counter
    post = Post.find_by(id: post_id)
    post.increment!(:comment_counter)
  end
end
