class CreateShoppeProductCategories < ActiveRecord::Migration
  def change
    create_table :shoppe_product_categories do |t|
    	t.string   "name"
      t.string   "permalink"
      t.text     "description"
      t.timestamps null: false
    end

    add_index :shoppe_product_categories, :permalink
  end
end
