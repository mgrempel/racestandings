class DriversController < ApplicationController
  def index
    root_query = Driver.includes(:laptimes).all
    unless params[:search] == "" || params[:search].nil?
      root_query = if params[:category] == "Drivers"
                     root_query.where(first_name: params[:search]).or(root_query.where(last_name: params[:search]))
                   else
                     root_query.where(laptimes: { laptime: params[:search] })
                   end

    end
    @drivers = root_query
    @categories = ["Drivers", "Laptimes"]
  end

  def show
    @driver = Driver.find(params[:id])
  end
end
