class Api::V1::CompaniesController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_company, :destroy, :update]


  def index
    companies = Company.all
    render json: companies
  end

  def show
    company = Company.find(params[:id])
    render json: company
  end

  def create
    company = Company.create(company_params)
    if company.valid?
      token = JWT.encode({company_id: company.id}, "my_s3cr3t")

      render json: { company: {name: company.name, catch_phrase: company.catch_phrase, logo: company.logo}, token: token}, status: :created
    else
      render json: { error: 'failed to create company' }, status: :not_acceptable
    end
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

  def get_company
    token = request.headers["authorization"]

    id = JWT.decode(token, 'my_s3cr3t')[0]['company_id']
    company = Company.find(id)

    if company.valid?
      render json: company
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :catch_phrase, :logo, :password)
  end

end
