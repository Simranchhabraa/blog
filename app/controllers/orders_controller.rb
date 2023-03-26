class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  def show
    @order = Order.find(params[:id])
  end
  def create
    @order = Order.new(product_id: Cart.find(params[:id ]).product.id, cart_id: params[:id], merchant_id: current_merchant.id, status: "pending" )
    if @order.save
      redirect_to orders_path, notice: "Sucessfully! Your order placed"
    else
      render :new
    end
  end
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path, notice: "Removed Successfully from Order"
end

  private

    def order_params
      params.require(:order).permit(:status, :product_id, :cart_id, :merchant_id)
    end

end
