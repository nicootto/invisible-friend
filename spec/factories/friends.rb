FactoryBot.define do
  factory :friend do
    association :user
    association :group
    association :friend, factory: :user
  end
end