class CartsController < ApplicationController

  def show
    if !current_user
      redirect_to :root
    else
      @user = current_user
    end
  end
end
