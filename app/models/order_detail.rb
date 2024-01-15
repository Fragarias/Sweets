class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum production_status: {
    unable_to_start: 1,
    waiting_for_production: 2,
    in_production: 3,
    production_completed: 4
  }
end
