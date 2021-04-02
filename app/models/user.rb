class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games
  has_secure_password

  validates :email, presence: true, uniqueness: true

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
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
