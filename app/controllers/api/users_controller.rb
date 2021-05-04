class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render "show.json.jb"
  end

  def index
    @users = User.all
    render "index.json.jb"
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: 401
    end
  end

  def update
    if !current_user
      render json: { message: "you must be logged in to do that" }, status: :unauthorized
      return
    end

    @user = User.find(params[:id])
    if current_user.id != @user.id
      render json: { message: "this isn't your page" }, status: 401
      return
    end

    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation

    if @user.save
      render json: { message: "information successfully updated" }, status: 200
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def destroy
    if !current_user
      render json: { message: "you must be logged in to do that" }, status: :unauthorized
      return
    end

    @user = User.find(params[:id])
    if current_user.id != @user.id
      render json: { message: "this isn't your page" }, status: 401
      return
    end

    user = User.find(params[:id])
    user.destroy
    render json: { message: "user successfully deleted", status: 200 }
  end
end
