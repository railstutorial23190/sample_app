class UsersController < ApplicationController
before_action :logged_in_user, only: [:index,:edit, :update,:destroy]  # GET /users/:id
before_action :correct_user,    only:[:edit,:update]
before_action :admin_user, only: :destroy


  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to users_path
  end
  def index
    @users = User.paginate(page: params[:page])
  end
  
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
      log_in @user
      flash[:success] = "Welcome to the Sample!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
 def edit
  @user = User.find(params[:id])
 end
 
 def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     #更新に成功した場合扱う
      flash[:success] = "Profile updated"
      redirect_to @user
   else
     render 'edit'
   end
 end
 
  private
  
  def user_params
    params.require(:user).permit(:name, :email,:password,
                                  :password_confirmation)
  end
  
  # beforeアクション
  
  # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end