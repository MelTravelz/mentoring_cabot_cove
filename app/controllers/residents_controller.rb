class ResidentsController < ApplicationController
  def index
    @residents = Resident.all.alphabetize
  end

  def show
    @resident = Resident.find(params[:id])
  end
end