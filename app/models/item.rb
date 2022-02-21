class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :item_name
    validates :price

    validates :image
  end

    validates :quantity_id, numericality: { other_than: 1, message: "can't be blank" } 

  belongs_to :user
  belongs_to :quantity
  belongs_to :size
  has_one_attached :image
end
