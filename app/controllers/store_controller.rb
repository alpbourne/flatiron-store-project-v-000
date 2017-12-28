class StoreController < ApplicationController

  def index
    binding.pry
    @categories = Category.all
    @items = Item.all
  end
end
