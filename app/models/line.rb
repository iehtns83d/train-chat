class Line < ApplicationRecord
  has_many :line_users
  has_many :users, through: :line_users
  has_many :line_stations
  has_many :stations, through: :line_stations
  has_many :messages
  validates :name, presence: true, uniqueness: true
end
