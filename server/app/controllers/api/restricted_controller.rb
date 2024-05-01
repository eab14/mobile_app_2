class Api::RestrictedController < ApplicationController
  before_action :authorize

  # if the user is logged in
  def index
    render json: { message: 'Restricted Area: Users logged in only...' }
  end

  private

  #ensuring the token is present within the Auth header
  def authorize
    token = request.headers['Authorization']&.split(' ')&.last
    if token.nil?
      render json: { error: 'Authorization header missing' }, status: :unauthorized
      return
    end
  
    begin
      payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      @current_user = User.find(payload[0]['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end