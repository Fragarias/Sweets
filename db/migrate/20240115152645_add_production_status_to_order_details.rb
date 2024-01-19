class AddProductionStatusToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :production_status, :integer, null: false, default: 1
  end
end
