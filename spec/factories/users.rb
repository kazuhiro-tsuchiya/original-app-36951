FactoryBot.define do
  factory :user do
    nickname { 'suzuki' }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
  end
end
