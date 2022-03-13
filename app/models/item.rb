class Item < ApplicationRecord
  has_one_attached :image_id
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_datiles, dependent: :destroy

  def taxin_price
        price*1.08
  end

  def get_image_id(width, height)
    image_id.variant(resize_to_limit: [width, height]).processed
  end
   with_options presence: true do
        validates :name
        validates :introduction
        validates :price
        validates :image_id
      end

end
