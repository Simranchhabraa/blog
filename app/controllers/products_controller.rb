class ProductsController < ApplicationController
      def index
        @products = Product.all
        # @products = Product.where(merchant_id: current_merchant.id)
      end
    
      def show
        @product = Product.find(params[:id])
      end
    
      def new
        @product = Product.new
      end
    
      def create
        @product = Product.new(product_params)
        @product.merchant_id = current_merchant.id 
    
        if @product.save
          redirect_to @product
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      def edit
        @product = Product.find(params[:id])
      end
    
      def update
        @product = Product.find(params[:id])
    
        if @product.update(product_params)
          redirect_to @product
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to @product
      end

    
      private
        def product_params
          params.require(:product).permit(:name, :desc, :price, :status, :category_id, :images, :merchant_id )
        end
      end
