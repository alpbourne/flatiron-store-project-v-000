module ApplicationHelper
  def current_cart=(cart)
    if cart
      self.current_cart_id = cart.id
    else
      self.current_cart_id = nil
    end
    self.save
  end

 def current_cart
   @current_cart = Cart.find_or_create_by(id: self.current_cart_id)
 end

end
