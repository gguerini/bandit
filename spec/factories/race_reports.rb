FactoryGirl.define do
  factory :race_report do
    user
    name "Super Ultra 5k"
    race_date Date.new(2016, 10, 7)

    trait :with_sections do
      transient do
        number_of_sections 3
      end

      after(:build) do |race_report, evaluator|
        create_list(:race_report_section, evaluator.number_of_sections, race_report: race_report)
      end
    end
  end
end
