class LineItemsController < ApplicationController

  def create
    if current_cart
      @cart.add_item(params[:item_id])
    else
      @cart = current_user.carts.create
      current_cart=(@cart)
      @cart.add_item(params[:item_id])
      @cart.save

    end
  end

private

  # def line_item_params
  #   params.require(:item_id).permit(:item_id)
  # end
end
