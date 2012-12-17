FactoryGirl.define do
  factory :cycle do
    sequence(:title) {|n| "Cycle #{n}" }
#    title "Geek-art"
    sequence(:description) {|n| "Description of Cycle #{n}" }
#    description "Description of cycle 1"
  end
end

FactoryGirl.define do
  factory :event do
    title "Event 1"
    description "Description of event 1"
  end
end

