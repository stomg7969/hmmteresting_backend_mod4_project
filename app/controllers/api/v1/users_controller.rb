class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user]

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
    user = User.create(user_params)
    if user.valid?
      token = JWT.encode({user_id: user.id}, "my_s3cr3t")
      render json: { user: {username: user.username, email: user.email, img: user.img}, token: token}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def get_user
    token = request.headers["authorization"]
    # byebug olleh
    id = JWT.decode(token, 'my_s3cr3t')[0]['user_id']
    user = User.find(id)
    if user.valid?
      render json: { user: user  }
    end
  end
  # how to store ENV['my_s3cr3t]' into .env?
  # I think the answer is using the Figaro Gem

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :img, :email, :password)
  end
end
