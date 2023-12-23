class SectionsController < ApplicationController

  def create
    section = Section.create(section_params)
    # render :index ?
  end

  def index
    @sections = Section.all
  end

  def show
    section = Section.find_by_id(topic_params[:id])
    @topics = section.topics
  end

  def destroy
    section = Section.find(section_params[:id])
    section.destroy
    redirect_to sections_path
  end

  private
  def section_params
    params.require(:section).permit(:id, :title)
  end

end
