class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(user_id: current_user.id, id: params[:post_id])
    else
      render :new
    end
  end

  def destroy
    # @post = Post.find_by_id(params[:id])
    # @user = User.find_by_id(params[:user_id])
    # @comment = Comment.where(author: @user, post: @post)
    @comment = Comment.find_by_id(params[:comment_info])

    @comment.destroy

    respond_to do |format|
      format.html do
        redirect_to "/users/#{params[:user_id]}/posts/#{params[:id]}", notice: 'Comment was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
