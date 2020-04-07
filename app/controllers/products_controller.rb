class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product.images.build()
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
  
  private
    def product_params
        params.require(:product).permit(:name, :brand, :description, :condition, :delivery_fee, :delivery_area, :delivery_day, :price, :delivery_day, :price, :category_id, :user_id, images_attributes: [:image, :_destroy, :id])
    end

    def product_find
        @product = Product.find(params[:id])
    end
end
