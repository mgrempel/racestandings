class LaptimesController < ApplicationController
  def index
    @laptimes = Laptime.all
  end

  def show
    @laptime = Laptime.find(params[:id])
  end
end
