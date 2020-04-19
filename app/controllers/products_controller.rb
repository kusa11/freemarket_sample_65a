class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :show]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
    def product_params
        params.require(:product).permit(:name, :brand, :description, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price, :delivery_day_id, :price, :category_id, :user_id, images_attributes: [:image]).merge(user_id: current_user.id)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
