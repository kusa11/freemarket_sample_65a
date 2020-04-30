class SignupController < ApplicationController

  def first
  end

  def second
    @user = User.new
  end

  def third
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]    
    session[:user_first_name] = user_params[:first_name] 
    session[:user_last_name] = user_params[:last_name]
    session[:user_first_name_kana] = user_params[:first_name_kana]
    session[:user_last_name_kana] = user_params[:last_name_kana]

    @user = User.new
  end

  def fourth
    session[:phone_number] = user_params[:phone_number]
    
    @user = User.new
  end

  def fifth
    @user = User.new
    # @user.build_address
  end

  def sixth
    @user = User.new
  end




  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      first_name: session[:user_first_name],
      last_name: session[:user_last_name],
      first_name_kana: session[:user_first_name_kana],
      last_name_kana: session[:user_last_name_kana],
      phone_number: session[:phone_number]
    )
    if @user.save(
      #  @address = @user.build_address(
        first_name: session[:address_first_name],
        last_name: session[:address_last_name],
        first_name_kana: session[:address_first_name_kana],
        last_name_kana: session[:address_last_name_kana],
        phone_number: session[:address_phone_number],
        post_number: session[:post_number],
        prefecture: session[:prefecture],
        city: session[:city],
        address_number: session[:address_number],
        building: session[:building],
        )      
      @address.save
      session[:id] = @user.id
      redirect_to '/signup/done'
      else
        render '/signup/first'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :encrypted_password,
      :birth_year,
      :birth_month,
      :birth_day,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :phone_number,

      address_attributes:[
      :id,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :post_number,
      :prefecture,
      :city,
      :address_number,
      :building,
      :phone_number
      ]
    )
    end

end
