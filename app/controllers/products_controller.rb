class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
    @products = Product.includes(:images).order('created_at DESC').page(params[:page]).per(6)
  end

  def new
    @product = Product.new
    @product.images.new
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path
    else
      #データベースから、親カテゴリーのみ抽出し、配列化
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
      render :new
    end
  end


  def show
    @category = @product.category
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

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  private
  def product_params
    # ユーザー登録ができていない為ID１を仮置き
    params.require(:product).permit(:name, :brand, :description, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price, :delivery_day_id, :price, :category_id, images_attributes: [:image]).merge(user_id: 1)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
