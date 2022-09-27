class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def invalid(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def not_found(e)
    render json: {
             "error": "#{e.model} not found",
           }, status: :not_found
  end
end
