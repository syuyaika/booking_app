class UsersController < ApplicationController
  before_action :authenticate_user!

  def settings
    @user = current_user
  end

  def update_account
    @user = current_user
    if @user.update_without_password(user_account_params)
      redirect_to account_settings_path, notice: "アカウント情報を更新しました"
    else
      render :edit_account
    end
  end

  def edit_account
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_profile_params)
      redirect_to account_settings_path, notice: "プロフィールを更新しました"
    else
      render :edit_profile
    end
  end

  private

  def user_account_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def user_profile_params
    params.require(:user).permit(:username, :avatar, :bio)
  end
end
