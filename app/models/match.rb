class Match < ApplicationRecord
  has_many :goals, dependent: :destroy

  validates :date, presence: true
  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :stadium, presence: true

  def self.seed(attributes)
    match = Match.new(attributes)
    match.save!(validate: false)
  end
end
