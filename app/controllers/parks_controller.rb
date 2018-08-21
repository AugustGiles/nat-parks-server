class ParksController < ApplicationController

  def index

    render json: Park.all, each_serializer: ParkListingSerializer
  end

  def show
    @park = Park.find(params[:id])
    render json: @park
  end


end
