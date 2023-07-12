class MatchesController < ApplicationController
  def index
    @matches = Match.paginate(page: params[:page], per_page: 50)

  end

  def show
    @match = Match.find(params[:id])
    @home_team = @match.home_team
  @away_team = @match.away_team
  end


end
