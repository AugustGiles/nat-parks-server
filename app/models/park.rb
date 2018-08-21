class Park < ApplicationRecord
  has_many :park_states
  has_many :states, through: :park_states
  has_many :user_parks
  has_many :users, through: :user_parks
end
