class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  before_save :update_likes

  def update_likes
    post = Post.find_by_id(post_id)
    post.likes_counter = post.likes_counter.to_i + 1
    post.save
  end
end
