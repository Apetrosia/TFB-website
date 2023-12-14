class ForumController < ApplicationController
  def index
    @sections = Section.all
  end

  def index_topics
    section = Section.find_by_id(section_params[:section_id])
    @topics = section.topics
  end

  def show
    @topic = Topic.find_by_id(topic_params[:id])
  end

  private
  def section_params
    params.require(:section).permit(:section_id)
  end

  def topic_params
    params.require(:topic).permit(:id)
  end

end
