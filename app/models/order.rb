class Order < ApplicationRecord

  belongs_to :customer

  enum payment_method: {
    credit_card: 1,
    transfer: 2
  }

end
