class Team < ApplicationRecord
  with_options presence: true do
    validates :news_name
    validates :news_title
    validates :news_text
    validates :news_image
  end

end
