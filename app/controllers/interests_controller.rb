class InterestsController < ApplicationController
  def index
    interests = Interest.all
    render json: interests
  end

  def create
    interest = Interest.create(user: params[:user_id], product: params[:product_id])
    render json: interest
  end

  def destroy
    interest = Interest.find(params[:id])
    interest.destroy
    render json: interest
  end
end
