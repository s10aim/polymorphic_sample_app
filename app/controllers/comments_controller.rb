class CommentsController < ApplicationController
  before_action :set_object

  def create
    @comment = @object.comments.build(comment_params)
    if @comment.save
      redirect_back(fallback_location: @object)
    else
      @post = @movie = @object
      @comments = @object.comments.where.not(id: nil)
      render "#{@object.model_name.plural}/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_object
    @object = if params[:movie_id].present?
                Movie.find(params[:movie_id])
              elsif params[:post_id].present?
                Post.find(params[:post_id])
              else
                raise ActionController::ParameterMissing, self
              end
  end
end
