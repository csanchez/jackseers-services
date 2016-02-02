class CreateShoppeStockLevelAdjustments < ActiveRecord::Migration
  def change
    create_table :shoppe_stock_level_adjustments do |t|
    	 t.integer  "item_id"
      t.string   "item_type"
      t.string   "description"
      t.integer  "adjustment",  default: 0
      t.string   "parent_type"
      t.integer  "parent_id"
      t.timestamps null: false
    end
    add_index :shoppe_stock_level_adjustments, [:item_id, :item_type], name: 'index_shoppe_stock_level_adjustments_items'
     add_index :shoppe_stock_level_adjustments, [:parent_id, :parent_type], name: 'index_shoppe_stock_level_adjustments_parent'
  end
end
