FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    picture { 'path_to_picture' }
    association :owner, factory: :user
  end
end