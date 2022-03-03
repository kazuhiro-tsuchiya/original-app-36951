FactoryBot.define do
  factory :purchase_address do
    size_id       { Faker::Number.between(from: 2, to: 5) }
    quantity_id   { Faker::Number.between(from: 2, to: 11) }
    post_code     { '123-4567' }
    area          { '東京都' }
    city          { '港区' }
    street        { '1-1' }
    building_name { '東京ハイツ' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
