class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cart_id, :integer
    add_column :orders, :status, :string
    add_column :orders, :total, :integer
  end
end
