class HomeController < ApplicationController
  def index
    User.destroy_all
  end
end
