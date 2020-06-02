class SignupController < ApplicationController
  before_action :validates_step1, only: :third
  before_action :validates_step2, only: :fifth
  before_action :validates_step3, only: :create
  
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

  def fifth
    @user = User.new
    @address = @user.build_address
  end

  def validates_step1
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:user_first_name] = user_params[:first_name] 
    session[:user_last_name] = user_params[:last_name]
    session[:user_first_name_kana] = user_params[:first_name_kana]
    session[:user_last_name_kana] = user_params[:last_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:user_first_name],
      last_name: session[:user_last_name],
      first_name_kana: session[:user_first_name_kana],
      last_name_kana: session[:user_last_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
    )

    @user.errors.full_messages
    render second_signup_index_path unless @user.valid?(:validates_step1)

  end

  def validates_step2
    session[:phone_number] = user_params[:phone_number]

    @user = User.new(phone_number: session[:phone_number])
    render third_signup_index_path unless @user.valid?(:validates_step2)

  end

  def validates_step3

    session[:last_name] = user_params[:address_attributes][:last_name]
    session[:first_name] = user_params[:address_attributes][:first_name]
    session[:last_name_kana] = user_params[:address_attributes][:last_name_kana]
    session[:first_name_kana] = user_params[:address_attributes][:first_name_kana]
    session[:post_number] = user_params[:address_attributes][:post_number]
    session[:prefecture_id] = user_params[:address_attributes][:prefecture_id]
    session[:city] = user_params[:address_attributes][:city]
    session[:address_number] = user_params[:address_attributes][:address_number]
    session[:building] = user_params[:address_attributes][:building]
    session[:phone_number] = user_params[:address_attributes][:phone_number]

    @user = User.new
    
    @address = Address.new(
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      post_number: session[:post_number],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      address_number: session[:address_number],
      building: session[:building],
      phone_number: session[:phone_number]

    if @user.save!(
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
        # )      

    )
    @user.address = @address
    render fifth_signup_index_path unless @address.valid?(:validates_step3)
  end


  def create
    
    @user.build_address(user_params[:address_attributes])
    if @user.save
      @user.address.user_id = @user.id
      session[:user_id] = @user.id
      redirect_to done_signup_index_path
    else
        render first_signup_index_path
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?

    redirect_to new_user_card_path(session[:id])
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
      :prefecture_id,
      :city,
      :address_number,
      :building,
      :phone_number
      ]
    )
    end

end
