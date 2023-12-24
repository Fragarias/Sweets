class ChangeColumnDefaultToItems < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :is_sale, from: nil, to: true
  end
end
