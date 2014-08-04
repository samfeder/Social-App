class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:session][:email],
      params[:session][:password]
    )

    if @user.nil?
      flash.now[:errors] = ["Invalid email/password combination"]
      render :new
    else
      #will become a user's feed
      sign_in!(@user)
      redirect_to user_circles_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    sign_out!
    @user = User.new
    render :new
  end

end
