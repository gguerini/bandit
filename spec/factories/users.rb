FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    sequence(:username) { |n| "johndoe#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com"}
    password "p@ssw0rd"
  end
end
