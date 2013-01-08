FactoryGirl.define do
  sequence(:cycleTitle) {|n| "Cycle #{n}" }
  sequence(:cycleDescription) {|n| "Cycle description #{n}" }

  factory :cycle do
    title {FactoryGirl.generate(:cycleTitle)}
    description {generate :cycleDescription }
  end
end


