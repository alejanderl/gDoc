FactoryGirl.define do
  sequence(:eventTitle) {|n| "Event #{n}" }
  sequence(:eventDescription) {|n| "Event description #{n}" }

  factory :event  do
    cycle #creates directly association belongs_to with cycle
    title {FactoryGirl.generate(:eventTitle)}
    description {generate :eventDescription }
    date {Date.yesterday}
    time {Time.now}
  end
end

