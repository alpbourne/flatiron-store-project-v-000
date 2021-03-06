class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    @total = 0
    self.line_items.each do |i|
      @total += (i.quantity * i.item.price)
    end
    @total
  end

  def add_item(item_id)
    if line = self.line_items.find_by(item_id: item_id)
      line.quantity +=1
      line.save
    else
      line = line_items.build(cart_id: self.id, item_id: item_id)
      line
    end
    line
  end
end
