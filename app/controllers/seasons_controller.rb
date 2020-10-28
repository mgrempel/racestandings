class SeasonsController < ApplicationController
  def index
    root_query = Season.includes(:circuits, :laptimes).all

    unless params[:search] == ""
      root_query = if params[:category] == "Seasons"
                     root_query.where(year: params[:search])
                   elsif params[:category] == "Circuits"
                     root_query.where(circuits: { name: params[:search] })
                   else
                     root_query.where(laptimes: { laptime: params[:search] })
                   end
    end
    @seasons = root_query
    @categories = ["Seasons", "Circuits", "Laptimes"]
  end

  def show
    @season = Season.find(params[:id])
  end
end
