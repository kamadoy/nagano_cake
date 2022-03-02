class Order < ApplicationRecord
  has_many :order_datiles, dependent: :destroy
end
