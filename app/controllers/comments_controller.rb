class CommentsController < ApplicationController

  before_action :find_topic

  def create
    if current_user.present?
      if current_user.email_conf
        comment = @topic.comments.create(comment_params.merge({ user_id: current_user.id }))
        redirect_to section_topic_path(@topic.section_id, @topic)
      else
        flash.alert = "Подтвердите, пожалуйста, вашу почту"
      end
    else
      flash.alert = "К сожалению, отправка комментариев доступна только зарегестрированным пользователям"
    end
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
    params.require(:comment).permit(:section_id, :topic_id, :id, :title, :user_id, :parent_comment_id)
  end
end
