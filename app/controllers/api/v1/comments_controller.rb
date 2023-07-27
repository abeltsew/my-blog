class Api::V1::CommentsController < ApplicationController
  before_action :authorize_request, only: :create

  def index
    @comments = Comment.where(post_id: params[:id])
    render json: @comments, except: %i[created_at updated_at]
  end

  def create
    @comment = Comment.new(author_id: @current_user.id, post_id: params[:id], text: params[:text])

    if @comment.save
      render json: { message: 'Created successfuly' }, status: :created
    else
      render json: { message: 'something went wrong' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
