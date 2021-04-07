class Api::UserGamesController < ApplicationController
  def show
    @user_game = UserGame.find(params[:id])
    @game = Game.find(@user_game[:game_id])
    render "show.json.jb"
  end
end
