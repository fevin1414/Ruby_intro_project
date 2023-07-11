class Match < ApplicationRecord
  has_many :goals

  validates :date, presence: true
  validates :home_team, presence: true, unless: -> { Rails.application.seeds_running? }
  validates :away_team, presence: true, unless: -> { Rails.application.seeds_running? }
  validates :stadium, presence: true, unless: -> { Rails.application.seeds_running? }

  def self.seed(attributes)
    match = Match.new(attributes)
    match.save!(validate: false)
  end
end
