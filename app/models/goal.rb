class Goal < ApplicationRecord
  belongs_to :match

  validates :player_name, :minute, presence: true

  def self.seed_random_goals(match)
    puts "Seeding goals for match: #{match.inspect}"
    rand(0..5).times do
      goal = match.goals.create(
        player_name: Faker::Sports::Football.player,
        minute: Faker::Number.between(from: 1, to: 90)
      )
      goal.save
    end
  end
end
