FactoryBot.define do
  factory :item do
    item_name        { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    price            { Faker::Number.between(from: 1, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/afire-1238266_1280.jpeg'), filename: 'maxresdefault.jpeg')
    end
  end
end
