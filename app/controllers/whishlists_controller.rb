class WhishlistsController < ApplicationController
  def index
    @whishlists = Whishlist.all
  end

  def show
    @whishlist = Whishlist.find(params[:id])
  end

  def new
    @whishlist = Whishlist.new
  end
  
  def create
    @whishlist =Whishlist.new(product_id: params[:id], merchant_id: current_merchant.id)
    if @whishlist.save
      redirect_to whishlists_path, notice: "Product added to whishlist"
    end
  end

  private

    def whishlist_params
      params.require(:whishlist).permit(:product_id, :merchant_id)
    end

end
