class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.float :total
      t.string :status, :default => nil
    end
  end
end
