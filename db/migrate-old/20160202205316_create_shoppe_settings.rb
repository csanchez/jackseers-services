class CreateShoppeSettings < ActiveRecord::Migration
  def change
    create_table :shoppe_settings do |t|
    	 t.string "key"
      t.string "value"
      t.string "value_type"
      t.timestamps null: false
    end
    add_index :shoppe_settings, :key
  end
end
