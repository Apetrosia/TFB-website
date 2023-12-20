class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    section = Section.find_by_id(topic_params[:id])
    @topics = section.topics
  end

  private
  def section_params
    params.require(:section).permit(:id)
  end

end
