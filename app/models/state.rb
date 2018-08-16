class State < ApplicationRecord
  has_many :park_states
  has_many :parks, through: :park_states
end
