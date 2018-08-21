class ApplicationController < ActionController::API

  def generate_token(user)
    alg = 'HS256'
    payload = { user_id: user.id }
    JWT.encode payload, Rails.application.credentials.jwt, alg
  end

end
