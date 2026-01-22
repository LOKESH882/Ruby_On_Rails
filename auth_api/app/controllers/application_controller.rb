class ApplicationController < ActionController::API
  include JwtToken

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  rescue_from JWT::DecodeError, with: :unauthorized_response
  rescue_from NoAuthorizationHeaderError, with: :unauthorized_response

  before_action :authenticate_user

  private

  class NoAuthorizationHeaderError < StandardError; end

  def authenticate_user
    header = request.headers['Authorization']
    raise NoAuthorizationHeaderError, 'Missing authorization header' unless header

    token = header.split(' ').last

    raise NoAuthorizationHeaderError, 'Missing token' unless token

    @decoded = JwtToken.decode(token)
    @current_user = User.find(@decoded[:user_id])
  end

  def not_found_response(exception)
    render json: { error: exception.message }, status: :unauthorized
  end

  def unauthorized_response(exception)
    render json: { error: exception.message }, status: :unauthorized
  end
end

