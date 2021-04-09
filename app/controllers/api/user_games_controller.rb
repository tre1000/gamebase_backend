class Api::UserGamesController < ApplicationController
  before_action :authenticate_user, except: :show

  def show
    @user_game = UserGame.find(params[:id])
    # @game = Game.find(@user_game[:game_id])
    render "show.json.jb"
  end

  def create
    @user_game = UserGame.new({
      user_id: current_user.id,
      game_id: params[:game_id],
      status: params[:status],
      completion_hours: params[:completion_hours],
      completion_minutes: params[:completion_minutes],
      rating: params[:rating],
      review: params[:review],
    })

    if @user_game.save
      render json: { message: "Game successfully added to list" }, status: 200
    else
      render json: { errors: user_game.errors.full_messages }, status: 400
    end
  end

  def update
    @user_game = UserGame.find(params[:id])

    if @user_game.user_id != current_user.id
      render json: { message: "this isn't your page" }, status: :unauthorized
      return
    end

    @user_game.status = params[:status] || @user_game.status
    @user_game.completion_hours = params[:completion_hours] || @user_game.completion_hours
    @user_game.completion_minutes = params[:completion_minutes] || @user_game.completion_minutes
    @user_game.rating = params[:rating] || @user_game.rating
    @user_game.review = params[:review] || @user_game.review

    if @user_game.save
      render json: { message: "List successfully updated" }, status: 200
    else
      render json: { errors: @user_game.errors.full_messages }
    end
  end
end
