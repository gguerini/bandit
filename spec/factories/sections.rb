FactoryGirl.define do
  factory :section, aliases: [:race_report_section] do
    race_report
    title "Race day"
    description "The race went really well."
    sequence(:order) { |n| n }
  end
end
