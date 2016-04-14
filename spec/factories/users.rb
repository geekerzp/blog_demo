FactoryGirl.define do
  factory :user do
    username Faker::Name.name
    email Faker::Internet.email
    password 'fake_password'
    password_confirmation 'fake_password'
  end
end
