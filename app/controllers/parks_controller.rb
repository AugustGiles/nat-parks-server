class ParksController < ApplicationController 

  def index
    render json: Park.all
  end

  def show
    @park = Park.find(params[:id])
    render json: @park
  end


end
