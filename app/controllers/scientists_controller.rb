class ScientistsController < ApplicationController
  def index
    render json: Scientist.all
  end

  def show
    s = Scientist.find(params[:id])
    render json: s, serializer: ScientistWithPlanetsSerializer
  end

  def create
    s = Scientist.create!(scientist_params)
    render json: s, status: :created
  end

  def update
    s = Scientist.find(params[:id])
    s.update!(scientist_params)
    render json: s, status: :accepted
  end

  def destroy
    s = Scientist.find(params[:id])
    s.destroy
    head :no_content
  end

  private

  def scientist_params
    params.permit(:name, :field_of_study, :avatar)
  end
end
