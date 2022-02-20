class Item < ApplicationRecord
  has_one_attached :image_id
  belongs_to :genre

  def get_image_id(width, height)
    image_id.variant(resize_to_limit: [width, height]).processed
  end
end
