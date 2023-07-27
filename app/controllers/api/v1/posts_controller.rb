class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:id])
    render json: @posts, except: %i[created_at updated_at]
  end
end
