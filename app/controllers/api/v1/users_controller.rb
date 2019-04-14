class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update(username: params[:username], img: params[:img], email: params[:email], password_digest: params[:password_digest])
    render json: user
  end

  def create
    # user = User.create(user_params)
    user = User.create(username: params[:username], img: params[:img], email: params[:email], password_digest: params[:password_digest])
    # byebug
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
      # render json: {user: UserSerializer.new(user)}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  # private
  # def user_params
  #   params.require(:user).permit(:username, :img, :email, :password_digest)
  # end
end
