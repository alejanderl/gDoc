FactoryGirl.define do
  factory :event do
    cycle #creates directly association belongs_to with cycle
    title "Event 1"
    description "Description of event 1"
  end
end

