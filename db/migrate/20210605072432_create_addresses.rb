class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase_management, null: false, foreign_key: true
      t.string :post_code, null: false
      t.string :phone_number, null: false
      t.integer :shipping_area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.timestamps
    end
  end
end
