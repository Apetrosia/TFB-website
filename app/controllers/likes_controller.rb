class LikesController < ApplicationController

  before_action :find_comment

  def create
    @like = @comment.likes.create(user_id: current_user.id)
    redirect_to section_topic_comment_path(@comment.topic.section, @comment.topic, @comment)
  end

  def destroy
    @like = @comment.likes.find(params[:id])
    @like.destroy
    redirect_to section_topic_comment_path(@comment.topic.section, @comment.topic, @comment)
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end
end