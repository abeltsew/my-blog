class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:id])
    render json: @comments, except: %i[created_at updated_at]
  end

  def create
    @comment = Comment.new(author_id: 1, post_id: 11, text: 'hard codded comment')

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
