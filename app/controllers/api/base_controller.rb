class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def unprocessable_entity(record)
    render json: { error: record.errors.full_messages }, status: :unprocessable_entity
  end

  def unexpected_error
    render json: { error: 'Unexpected Error' }, status: :internal_server_error
  end

  def authenticate!
    render json: { error: '401 Unauthorized' }, status: :unauthorized unless authenticated
  end

  def authenticated
    params[:access_token] && @current_user = User.find_by(authentication_token: params[:access_token])
  end

  private

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def default_serializer_options
    {root: false}
  end
end
