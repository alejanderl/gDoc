FactoryGirl.define do
  


 factory :participant do
    name "Nombre 1"
    bio  "Bio de prueba"
 end
 
 
  factory :photo do
    sequence(:title) {|n| " Photo title #{n}" }
    sequence(:description) {|n| "Description of photo #{n}" }
  end

end
