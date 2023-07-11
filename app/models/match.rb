class Match < ApplicationRecord
  has_many :goals

  validates :date, :home_team, :away_team, :stadium, presence: true
end