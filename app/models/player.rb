class Player < ApplicationRecord
  with_options presence: true do
    validates :player_name
    validates :number
    validates :image
  end

  has_one_attached :image
end
