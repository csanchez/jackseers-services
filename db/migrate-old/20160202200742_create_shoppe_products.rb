class CreateShoppeProducts < ActiveRecord::Migration
  def change
    create_table :shoppe_products do |t|
    	#t.integer  "parent_id"
      t.integer  "product_category_id"
      t.string   "name"
      t.string   "sku"
      t.string   "permalink"
      t.text     "description"
      t.text     "short_description"
      t.boolean  "active",                                      default: true
      t.decimal  "weight",              precision: 8, scale: 3, default: 0.0
      t.decimal  "price",               precision: 8, scale: 2, default: 0.0
      t.decimal  "cost_price",          precision: 8, scale: 2, default: 0.0
      t.integer  "tax_rate_id"
      #t.datetime "created_at"
      #t.datetime "updated_at"
      t.boolean  "featured",                                    default: false
      t.text     "in_the_box"
      t.boolean  "stock_control",                               default: true
      t.boolean  "default",                                     default: false
	  t.timestamps null: false


    end
    add_index :shoppe_products, :product_category_id
     add_index :shoppe_products, :sku
    
    add_index :shoppe_products, :permalink
  end
end
