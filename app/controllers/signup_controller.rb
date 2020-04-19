class SignupController < ApplicationController
  def first
  end

  def second
    @user = User.new
  end
  
  def third
    @user = User.new
  end

  def fourth
    @user = User.new
  end

end
