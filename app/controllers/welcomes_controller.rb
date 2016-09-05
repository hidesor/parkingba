class WelcomesController < ApplicationController
  layout 'welcome'
  def index
    @parks = Park.all
  end
end
