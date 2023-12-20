class TopicsController < ApplicationController

  def show
    valid_params = topic_params
    @topic = Section.find(valid_params[:section_id]).topics.find(valid_params[:id])
  end

  private
  def topic_params
    params.require(:topic).permit(:section_id, :id)
  end

end