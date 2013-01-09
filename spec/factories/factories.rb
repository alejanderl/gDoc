FactoryGirl.define do
  
  
  factory :cycle do
    sequence(:title) {|n| "Cycle #{n}" }
    sequence(:description) {|n| "Description of Cycle #{n}" }
  end

 factory :participant do
    name "Nombre 1"
    bio  "Bio de prueba"
 end
 
  factory :event do
    title "Event 1"
    description "Description of event 1"
  end
  
  factory :photo do
    sequence(:title) {|n| " Photo title #{n}" }
    sequence(:description) {|n| "Description of photo #{n}" }
  end

end
