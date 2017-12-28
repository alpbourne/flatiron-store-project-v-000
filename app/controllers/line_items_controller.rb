class LineItemsController < ApplicationController
  # before_action :current_cart

  def update
    if current_user
      if @cart =  current_user.current_cart
        @cart.add_item(params[:id])
      else
        @cart = Cart.create(user_id: current_user.id)
        @cart.add_item(params[:id])
        current_user.current_cart = @cart
        current_user.save
        binding.pry
      end

      redirect_to cart_path @cart
    else
      redirect_to store_path
    end
  end

private

  # def line_item_params
  #   params.require(:item_id).permit(:item_id)
  # end

  #
  # def current_cart
  #   @current_cart = current_user.current_cart
  # end
end
