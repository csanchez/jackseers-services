class CreateShoppeProductAttributes < ActiveRecord::Migration
  def change
    create_table :shoppe_product_attributes do |t|
    	t.integer  "product_id"
      t.string   "key"
      t.string   "value"
      t.integer  "position",   default: 1
      t.boolean  "searchable", default: true
      t.boolean  "public",     default: true
      t.timestamps null: false
    end

    add_index :shoppe_product_attributes, :product_id
    add_index :shoppe_product_attributes, :key
    add_index :shoppe_product_attributes, :position
  end
end
