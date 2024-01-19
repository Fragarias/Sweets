class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {
    credit_card: 1,
    transfer: 2
  }
  enum status: {
    waiting_for_payment: 1,
    payment_confirmed: 2,
    in_production: 3,
    preparing_to_ship: 4,
    shipped: 5
  }
end
