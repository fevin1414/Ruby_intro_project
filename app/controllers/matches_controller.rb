class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    @home_team = @match.home_team
  @away_team = @match.away_team
  end


end
