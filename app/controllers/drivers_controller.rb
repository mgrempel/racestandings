class DriversController < ApplicationController
  def index
    @results = Driver.all
  end
end
