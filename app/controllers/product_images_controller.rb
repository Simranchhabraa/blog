class ProductImagesController < ApplicationController
  def index
    @product_images = ProductImage.all
   #@product_images = ProductImage.where(merchant_id: current_merchant.id)
  end

  def show
    @product_image = ProductImage.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @product_image = ProductImage.new
  end

  def create
    @product_image = ProductImage.new(product_image_params)
    @product_image.product_id = params[:product_id]
    @product = Product.find(params[:product_id])
    

    if @product_image.save
      redirect_to product_product_image_url(@product, @product_image)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:product_id])

    @product_image = ProductImage.find(params[:id])
  end

  def update
    @product_image = ProductImage.find(params[:id])

    if @product_image.update(product_image_params)
      redirect_to product_product_image_url
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @product_image = ProductImage.find(params[:id])
    @product_image.destroy
    redirect_to product_product_images_path
  end


  private

    def product_image_params
      params.require(:product_image).permit(:image, :product_id)
    end

end
