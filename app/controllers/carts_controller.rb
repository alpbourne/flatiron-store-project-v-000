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
    binding.pry
    current_user.current_cart.line_items.each do |line_item|
      unit = Item.find(line_item.item.id)
      unit.inventory = unit.inventory - line_item.quantity
      unit.save
    end
    Order.create(current_cart)
    current_user.current_cart.delete

    render cart_path(current_user.current_cart)
  end

  private

  # def current_cart
  #   @current_cart = current_user.current_cart
  # end




end
