class TopicsController < ApplicationController

  before_action :find_section

  def create
    topic = @section.topics.create(topic_params)
    redirect_to section_path(topic.section_id)
  end

  def show
    @topic = @section.topics.find(topic_params[:id])
  end

  def destroy
    topic = @section.topics.find(topic_params[:id])
    topic.destroy
    redirect_to section_path(topic.section_id)
  end

  private
  def topic_params
    params.require(:topic).permit(:section_id, :id, :title, :content)
  end

  def find_section
    @section = Section.find(params[:section_id])
  end

end