class WelcomesController < ApplicationController
  layout 'welcome'
  def index
    @parks = Park.all.order(:id

    if params[:search].present?
      p '-----userx-----'
      p params[:search]
        @parks = Park.near(params[:search].to_s, 2, :order => "distance")
        p '-----userx-----'
        p @parks.first

    end
    p '-----userx-----'
    #  @projects = Project.search(params[:search])
  end
end
