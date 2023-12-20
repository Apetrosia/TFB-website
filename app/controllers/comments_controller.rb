class CommentsController < ApplicationController

  before_action :find_topic

  def create
    comment = @topic.comments.create(comment_params)
    redirect_to section_topic_path(@topic.section_id, @topic)
  end

  def destroy
    comment = @topic.comments.find_by_id(params[:id])
    comment.destroy
    redirect_to section_topic_path(@topic.section_id, @topic)
  end

  private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end

  def comment_params
    params.require(:comment).permit(:section_id, :topic_id, :id, :content, :user_id, :parent_comment_id)
  end
end
