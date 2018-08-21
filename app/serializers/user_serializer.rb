class UserSerializer < ActiveModel::Serializer
  attributes :username
  has_many :parks, serializer: ParkListingSerializer
end
