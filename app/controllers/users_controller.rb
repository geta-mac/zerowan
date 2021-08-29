class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to request.referer
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :address, :phone, :raising_experience, :birth_date)
  end
end
