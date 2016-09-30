FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    sequence(:email) { |n| "user_#{n}@example.com"}
    password "p@ssw0rd"
  end
end
