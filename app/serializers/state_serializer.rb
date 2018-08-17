class StateSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :parks, serializer: ParkListingSerializer
end
