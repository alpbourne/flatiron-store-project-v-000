class CartsController < ApplicationController
  # before_action :current_cart

  def show
    if !current_user
      redirect_to :root
    else
      @user = current_user
    end
  end

  def checkout
    current_user.current_cart.line_items.each do |line_item|
      unit = Item.find(line_item.item.id)
      unit.inventory = unit.inventory - line_item.quantity
      unit.save
    end
    Order.create(cart_id: current_user.current_cart_id, user_id: current_user.id, total: current_user.current_cart.total, status: 'submitted' )
    current_user.current_cart = nil
    current_user.save
    # current_user.current_cart.delete
    # why does it say missing template?

    redirect_to cart_path
  end

  private

  # def current_cart
  #   @current_cart = current_user.current_cart
  # end




end
