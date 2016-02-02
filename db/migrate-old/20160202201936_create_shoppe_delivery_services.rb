class CreateShoppeDeliveryServices < ActiveRecord::Migration
  def change
    create_table :shoppe_delivery_services do |t|
    	t.string   "name"
      t.string   "code"
      t.boolean  "default",      default: false
      t.boolean  "active",       default: true
      t.string   "courier"
      t.string   "tracking_url"
      t.timestamps null: false
    end

    add_index :shoppe_delivery_services, :active
    
  end
end
