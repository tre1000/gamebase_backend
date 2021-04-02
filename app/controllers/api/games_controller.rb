class Api::GamesController < ApplicationController
  def index
    @games = Game.all

    if params[:search]
      @games = Game.where("title ILIKE ? OR publisher ILIKE ? OR developer ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    render "index.json.jb"
  end

  def show
    @game = Game.find(params[:id])
    render "show.json.jb"
  end
end
