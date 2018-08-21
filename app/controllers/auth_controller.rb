class AuthController < ApplicationController

  def login
    username = params[:username]
    pw = params[:password]
    user = User.find_by(username: username)

    if user && user.authenticate(pw)
      render json: { success: true, token: generate_token(user) }
    else
      render json: { success: false }, status: 401 //status code here
    end
  end

end
