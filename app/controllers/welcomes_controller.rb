class WelcomesController < ApplicationController
  layout 'welcome'
  def index
    @parks = Park.all.order(:id)
    @order = params[:order]
    wgsx = params[:lat]
    wgsy = params[:lng]

    if @order=="distance"
        @parks = Park.near([wgsx.to_f,wgsy.to_f],10).limit(6)
    end
  end
end
