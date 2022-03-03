class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :item_name
    validates :price
    validates :image
  end

  has_one_attached :image
end
