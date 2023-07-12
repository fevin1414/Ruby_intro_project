class MatchesController < ApplicationController
  def index
    @matches = Match.paginate(page: params[:page], per_page: 50)


    if params[:search].present?
      @matches = Match.where("home_team LIKE :search OR away_team LIKE :search", search: "%#{params[:search]}%")
                     .paginate(page: params[:page], per_page: 50)
    else
      @matches = Match.paginate(page: params[:page], per_page: 50)
    end


  end

  def show
    @match = Match.find(params[:id])
    @home_team = @match.home_team
  @away_team = @match.away_team
  end


end
