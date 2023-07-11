require 'faker'
require 'uri'
require 'net/http'

# Seed fake data using Faker
100.times do
  Match.seed(
    date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    home_team: Faker::Sports::Football.team,
    away_team: Faker::Sports::Football.team,
    stadium: Faker::Address.unique.city + " Stadium"
  )
end

# Retrieve data from the API
url = URI("https://free-football-soccer-videos1.p.rapidapi.com/v1/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'a93d74b2bemshfa679349444da06p1d6893jsna4d5831e5bde'
request["X-RapidAPI-Host"] = 'free-football-soccer-videos1.p.rapidapi.com'

response = http.request(request)
matches_data = JSON.parse(response.read_body)

# Store the retrieved match data in the Matches table
matches_data.each do |match_data|
  Match.seed(
    date: match_data['date'],
    home_team: match_data['home_team'],
    away_team: match_data['away_team'],
    stadium: match_data['stadium']
  )
end
