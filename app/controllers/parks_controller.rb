require 'open-uri'
class ParksController < ApplicationController

  def index

    render json: Park.all, each_serializer: ParkListingSerializer
  end

  def show
    @park = Park.find(params[:id])
    render json: @park
  end

  def alerts
    park = Park.find(params[:id])
    url = "https://developer.nps.gov/api/v1/alerts?api_key=#{Rails.application.credentials.api_key}&parkCode=#{park.park_code}&limit=#{3}"

    data = JSON.parse(open(url).read)
    render json: data.to_json
  end

  def events

  end


end
