class WelcomesController < ApplicationController
  layout 'welcome'
  def index
    @parks = Park.all.order(:id)
    p '-----userx-----'
    p params[:userx]
    #  @projects = Project.search(params[:search])
  end
end
