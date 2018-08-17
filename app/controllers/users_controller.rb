class UsersController < ApplicationController

  def create
    User.create(username: params[:username], password: params[:password])
    
    render json: { success: true, token: generate_token(user) }
  end


end
