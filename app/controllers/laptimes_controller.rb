class LaptimesController < ApplicationController
  def index
    @laptimes = Laptime.all
  end
end
