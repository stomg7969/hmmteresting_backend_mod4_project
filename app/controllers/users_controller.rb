class UsersController < ApplicationController
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
    user.update(username: params[:username], img: params[:img], email: params[:email], password: params[:password])
    render json: user
  end

  def create
    user = User.create(username: params[:username], img: params[:img], email: params[:email], password: params[:password])
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end
end
