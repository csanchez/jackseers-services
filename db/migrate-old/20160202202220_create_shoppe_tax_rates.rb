class CreateShoppeTaxRates < ActiveRecord::Migration
  def change
    create_table :shoppe_tax_rates do |t|
    	 t.string   "name"
      t.decimal  "rate",        precision: 8, scale: 2
      t.text     "country_ids"
      t.timestamps null: false
    end
    add_column :shoppe_tax_rates, :address_type, :string
  end
end
