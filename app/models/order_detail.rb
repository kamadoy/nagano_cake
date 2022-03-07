class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
 enum making_status: { impossible: 0, weiting: 1,product_production: 2,completed: 3}
end
