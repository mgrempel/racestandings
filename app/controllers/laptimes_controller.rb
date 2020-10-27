class LaptimesController < ApplicationController
  def index
    root_query = Laptime.includes(:season, :driver, :circuit).all

    unless params[:search] == ""
      root_query = if params[:category] == "Laptimes"
                     root_query.where(laptime: params[:search])
                   elsif params[:category] == "Circuits"
                     root_query.where(circuits: { name: params[:search] })
                   elsif params[:category] == "Seasons"
                     root_query.where(Seasons: { year: params[:search] })
                   else
                     root_query.where(Drivers: { first_name: params[:search] }).or(root_query.where(Drivers: { last_name: params[:search] }))
                   end
    end
    @laptimes = root_query
    @categories = ["Laptimes", "Circuits", "Seasons", "Drivers"]
  end

  def show
    @laptime = Laptime.find(params[:id])
  end
end
