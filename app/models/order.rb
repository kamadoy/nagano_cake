class Order < ApplicationRecord
  has_many :order_datiles, dependent: :destroy
  belongs_to :customer
  attribute :select_adress, type: Integer
  attribute :adress_id, type: Integer
  enum payment_method: { credit_card: 0, transfer: 1 }
end
