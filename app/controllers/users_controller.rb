class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username:params[:username])
    if !@user
      @errors = "Incorrect username"
      render :new
      
    elsif !@user.authenticate(params[:password])
      @errors = "Incorrect password"
      
      render :new
    else 
      session[:user_id] = @user.id
      
      redirect_to playdates_path
  end
end


private

def user_params
  params.require(:user).permit(:username, :password)
end

end
