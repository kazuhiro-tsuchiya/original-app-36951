class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area, :city, :street, :building_name, :phone_number, :quantity_id, :size_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A0[5789]0\d{4}\d{4}\z|\A0\d{2}\d{3}\d{4}\z/, message: 'is invalid. Input only number' }
    validates :quantity_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :user_id
    validates :item_id
  end

  #validates :size_id, presence: true, on: :

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id, quantity_id: quantity_id, size_id: size_id)
    Address.create(post_code: post_code, area: area, city: city, street: street, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end