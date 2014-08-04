class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user.nil?
      flash.now[:errors] = ["Invalid email/password combination"]
      render :new
    else
      # redirect to...
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    sign_out!
    render :new
  end

end
