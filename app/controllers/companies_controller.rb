class CompaniesController < ApplicationController
  def show
    @company = company.find(params[:id])
  end
end
