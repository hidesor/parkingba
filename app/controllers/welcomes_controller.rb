class WelcomesController < ApplicationController
  layout 'welcome'
  def index
    @parks = Park.all
    p '-----userx-----'
    p params[:userx]
    #  @projects = Project.search(params[:search])
  end
end
