class CircuitsController < ApplicationController
  def index
    # @circuits = Circuit.all
    # @circuits = Circuit.where(name: params[:search]) unless params[:search] == ""

    @circuits = if params[:search] == ""
                  Circuit.all
                else
                  Circuit.where(name: params[:search])
                end

    @categories = ["Circuits", "Seasons", "Laptimes"]
  end

  def show
    @circuit = Circuit.find(params[:id])
  end
end
