class OrdersController < ApplicationController

  require 'payjp'
  before_action :set_card, only: [:new, :pay]
  before_action :set_product

  def new
    @image = @product.images.first
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    Payjp::Charge.create(
    :amount => @product.price,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end

  def done
    @image = @product.images.first
    Order.create(product_id: @product.id, user_id: current_user.id)
  end

  private

  def set_card
    @set_card = Card.where(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end