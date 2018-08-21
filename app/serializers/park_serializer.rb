class ParkSerializer < ActiveModel::Serializer
  attributes :id, :api_id, :description, :designation, :full_name, :coordinates, :url, :weather_info, :image_titles, :image_sources, :park_code
  has_many :states
end
