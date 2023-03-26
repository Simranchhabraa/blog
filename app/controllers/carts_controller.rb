class CartsController < ApplicationController
    
    def index
        @carts = Cart.all
    end
    def show 
        @cart = Cart.find(params[:id])
    end
    
    def cart
        @cart = Cart.new(product_id: params[:id ], merchant_id: current_merchant.id, quantity: 1)
        @cart.save!
        redirect_to products_path, notice: 'Product added to cart'
    end


    def update
        if @cart.update(cart_params)
            redirect_to carts_path, notice: 'cart updated'
        else
            render :edit
        end
    end
    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
        redirect_to carts_path
    end
    private
    def set_cart 
        @cart = Cart.find(params[:id])
    end
    def cart_params
        params.require(:cart).permit(:product_id, :merchant_id, :quantity)
    end
end
