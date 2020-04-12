class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.build()
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
          params[:images][:image].each do |image|
            @product.images.create(image: image, product_id: @product.id)
          end
        format.html{redirect_to root_path}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
    end
  end


  def show
  end

  def edit
  end
  
  private
    def product_params
        params.require(:product).permit(:name, :brand, :description, :condition, :delivery_fee, :delivery_area, :delivery_day, :price, :delivery_day, :price, :category_id, :user_id, images_attributes: [:image]).merge(user_id: current_user.id)
    end

    def product_find
        @product = Product.find(params[:id])
    end
end
