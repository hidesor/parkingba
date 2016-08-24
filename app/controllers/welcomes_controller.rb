class WelcomesController < ApplicationController
  def index
    @parks = Park.all
  end
end
