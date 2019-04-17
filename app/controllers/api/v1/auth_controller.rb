class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :create_company]

  def create # POST /api/v1/login_user
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def create_company # Post /api/v1/login_company
    @company = Company.find_by(name: params[:company][:name])
    if @company && @company.authenticate(params[:company][:password])
      @token = encode_token({ company_id: @company.id })
      render json: { company: CompanySerializer.new(@company), jwt: @token }, status: :accepted
    else
      render json: { message: 'Invalid company name or password' }, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
