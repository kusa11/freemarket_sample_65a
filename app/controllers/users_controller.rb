class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def logout
  end

  def credit_add
  end

  def credit_edit
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
