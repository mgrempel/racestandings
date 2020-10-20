class CircuitsController < ApplicationController
  def index
    @circuits = Circuit.all
  end
end
