class LikesController < ApplicationController

  def create
    like = Comment.find_by_id(params[:comment_id]).likes.create(user_id: session[:user_id])
    redirect_to section_topic_path(params[:section_id], params[:topic_id])
  end

  def destroy
    like = Like.find_by_id(params[:id])
    like.destroy
    redirect_to section_topic_path(params[:section_id], params[:topic_id])
  end

end