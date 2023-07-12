require 'faker'

# Seed fake data using Faker
max_records = 300

while Match.count < max_records
  home_team = Faker::Sports::Football.team
  away_team = Faker::Sports::Football.team

  next if Match.exists?(home_team: home_team, away_team: away_team)

  match = Match.new(
    date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    home_team: home_team,
    away_team: away_team,
    stadium: Faker::Address.unique.city + " Stadium"
  )

  match.save
end
