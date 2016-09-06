class WelcomesController < ApplicationController
  layout 'welcome'
  def index
    @parks = Park.all
    #  @projects = Project.search(params[:search])
  end
end
