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
    if line = self.line_items.find(item_id)
      qty = line.quantity +=1
      self.line_items.update(item_id: item_id, quantity: qty)

    else
      self.line_items.build(item_id: item_id)
    end
  end
end
