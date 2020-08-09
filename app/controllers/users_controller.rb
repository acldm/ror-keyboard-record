class UsersController < ApplicationController
  skip_before_action :logged_in_user, only: [:create]
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to root_path
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :salt, :encrypted_password)
    end
end
