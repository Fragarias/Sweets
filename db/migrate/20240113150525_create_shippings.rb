class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|
      t.string :postal_code,  null: false
      t.string :address,      null: false
      t.string :name,         null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
