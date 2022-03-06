class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  attribute :select_adress, type: Integer
  attribute :adress_id, type: Integer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { weiting_deposit: 0, payment_confimation: 1,production: 2,ready_ship: 3,sent: 4 }
end
