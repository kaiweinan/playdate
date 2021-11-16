class SessionsController < ApplicationController
  # skip_before_action :verified_user, only: [:new, :create]
    
  def new
  end

    def signup
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to playdates_path 
      else 
        @errors = @user.errors.full_messages
        render :signup
    end
  end
  
  def logout
    session.clear
  
    redirect_to '/'
  end
  
  def google
    @user = User.find_or_create_by(username: auth["info"]["name"]) do |user|
      user.password = SecureRandom.hex(10)
  end
  
    if @user && @user.id
      session[:user_id] = @user.id
      redirect_to playdates_path
    else
      redirect_to "/login"
    end
  end 

  private

  def auth
  request.env['omniauth.auth']
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
  