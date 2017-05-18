class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update]

  def show
  end

  # def edit
  # end

  def update
    @user.update(user_params)
    @user.save!
    redirect_to user_path(@user)
  end

  private

  def set_user
    # @user = User.find(params[:id])
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :photo)
  end
end
