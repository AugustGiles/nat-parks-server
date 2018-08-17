class ParkSerializer < ActiveModel::Serializer
  attributes :id, :api_id, :description, :designation, :full_name, :coordinates, :url, :weather_info
  has_many :states
end
