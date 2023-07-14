class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  before_save :update_likes

  def update_likes
    post = Post.find_by(id: post_id)
    post.increment!(:likes_counter)
  end
end
