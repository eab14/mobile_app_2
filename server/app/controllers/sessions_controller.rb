# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  # creating a session
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = encode_token(user.id)
      render json: { user: user, token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    # Implement logout action
  end

  private

  #token hashing
  def encode_token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end
end