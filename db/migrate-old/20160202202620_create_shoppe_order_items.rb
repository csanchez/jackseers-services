class CreateShoppeOrderItems < ActiveRecord::Migration
  def change
    create_table :shoppe_order_items do |t|
    	t.integer  "order_id"
      t.integer  "ordered_item_id"
      t.string   "ordered_item_type"
      t.integer  "quantity",                                  default: 1
      t.decimal  "unit_price",        precision: 8, scale: 2
      t.decimal  "unit_cost_price",   precision: 8, scale: 2
      t.decimal  "tax_amount",        precision: 8, scale: 2
      t.decimal  "tax_rate",          precision: 8, scale: 2
      t.decimal  "weight",            precision: 8, scale: 3, default: nil
      t.timestamps null: false
    end

    add_index :shoppe_order_items, [:ordered_item_id, :ordered_item_type], name: 'index_shoppe_order_items_ordered_item'
    add_index :shoppe_order_items, :order_id
  end
end
