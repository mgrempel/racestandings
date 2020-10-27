class CircuitsController < ApplicationController
  def index
    root_query = Circuit.includes(:seasons, :laptimes).all
    unless params[:search] == ""
      root_query = if params[:category] == "Circuits"
                     root_query.where(name: params[:search])
                   elsif params[:category] == "Seasons"
                     root_query.where(seasons: { year: params[:search] })
                   else
                     root_query.where(laptimes: { laptime: params[:search] })
                   end
    end
    @circuits = root_query
    @categories = ["Circuits", "Seasons", "Laptimes"]
  end

  def show
    @circuit = Circuit.find(params[:id])
  end
end
