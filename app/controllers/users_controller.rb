class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end
  # GET /users/new
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email,:password,
                                  :password_confirmation)
  end
end