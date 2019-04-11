class CompaniesController < ApplicationController
  def index
    companies = Company.all
    render json: companies
  end

  def show
    company = Company.find(params[:id])
    render json: company
  end

  def create
    company = Company.create(name: params[:name], catch_phrase: params[:catch_phrase], logo: params[:logo])
    render json: company
  end

  def update
    company = Company.find(params[:id])
    company.update(name: params[:name], catch_phrase: params[:catch_phrase], logo: params[:logo])
    render json: company
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy
  end
end
