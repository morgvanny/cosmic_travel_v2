class MissionsController < ApplicationController
  def create
    m = Mission.create!(mission_params)
    render json: m.planet, status: :created
  end

  private

  def mission_params
    params.permit(:scientist_id, :name, :planet_id)
  end
end
