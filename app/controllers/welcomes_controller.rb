class WelcomesController < ApplicationController
  layout 'welcome'
  def index
    @parks = Park.all.order(:id)
    if params[:search].present?  
        @parks = Park.near(params[:search].to_s, 2, :order => "distance")
    end
    p '-----userx-----'
    # p params[:userx]
    #  @projects = Project.search(params[:search])
  end
end
