class ProductsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    products = Product.all
    render json: products
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def create
    product = Product.create(name: params[:name], quota: params[:quota], completed: false, category: params[:category], description: params[:category], img: params[:img], company: params[:company_id])
    render json: product
  end

  def update
    product = Product.find(params[:id])
    product.update(name: params[:name], quota: params[:quota], completed: params[:completed], category: params[:category], description: params[:category], img: params[:img], company: params[:company_id])
    render json: product
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: product
  end

end
