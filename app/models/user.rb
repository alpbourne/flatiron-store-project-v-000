class User < ActiveRecord::Base
  has_many :orders
  has_many :carts


  def current_cart=(cart)
    self.current_cart_id = cart.id
    self.save
  end

  def current_cart
    @current_cart = Cart.find_by(id: self.current_cart_id)
  end
end
