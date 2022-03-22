class Team < ApplicationRecord

  with_options presence: true do
    validates :news_title
    validates :news_text
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
