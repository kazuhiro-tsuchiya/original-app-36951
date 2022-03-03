class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :price, numericality: { with: /\A[0-9]+\z/}
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
