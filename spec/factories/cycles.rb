FactoryGirl.define do
  factory :cycle do
    sequence(:title) {|n| "Cycle #{n}" }
    sequence(:description) {|n| "Description of Cycle #{n}" }
  end
end


