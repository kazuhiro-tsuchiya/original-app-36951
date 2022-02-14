class UsersController < ApplicationController

  def edit
    redirect_to root_path unless current_user.id
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :nickname, :password, :password_confirmation)
  end

end
