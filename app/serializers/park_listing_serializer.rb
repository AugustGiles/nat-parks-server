class ParkListingSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :coordinates, :designation
end
