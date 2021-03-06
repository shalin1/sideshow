class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      login(@user)
      render "/api/users/show"
    else
      render json: {password: ["Invalid username/password combination"]}, status: 401
    end
  end

  def destroy
    @user = current_user
    if @user
      logout
      render "api/users/show"
    else
      render json: ["Can't log out-- no current user!"], status: 404
    end
  end
end
