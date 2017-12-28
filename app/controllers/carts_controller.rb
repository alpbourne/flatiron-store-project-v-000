class CartsController < ApplicationController

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
    current_user.current_cart.delete

    render cart_path
  end



end
