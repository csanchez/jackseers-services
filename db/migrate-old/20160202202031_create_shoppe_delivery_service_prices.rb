class CreateShoppeDeliveryServicePrices < ActiveRecord::Migration
  def change
    create_table :shoppe_delivery_service_prices do |t|
    	t.integer  "delivery_service_id"
      t.string   "code"
      t.decimal  "price",               precision: 8, scale: 2
      t.decimal  "cost_price",          precision: 8, scale: 2
      t.integer  "tax_rate_id"
      t.decimal  "min_weight",          precision: 8, scale: 2
      t.decimal  "max_weight",          precision: 8, scale: 2
      t.text     "country_ids"
      t.timestamps null: false
    end
    add_index :shoppe_delivery_service_prices, :delivery_service_id
    add_index :shoppe_delivery_service_prices, :min_weight
    add_index :shoppe_delivery_service_prices, :max_weight
    add_index :shoppe_delivery_service_prices, :price
  end
end
