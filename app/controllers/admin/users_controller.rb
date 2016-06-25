class Admin::UsersController < ApplicationController
  before_filter :authorize

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      UserMailer.delete_email(@user).deliver_now
      redirect_to admin_users_path, notice: 'User was deleted'
    else
      flash[:error] = "error was nor deleted"
      redirect_to admin_user(@user)
    end
  end


  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end

end