class Goal < ApplicationRecord
  belongs_to :match

  validates :player_name, :minute, presence: true
end