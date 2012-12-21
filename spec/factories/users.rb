# Read about factories at https://github.com/thoughtbot/factory_girl

# This will guess the User class
FactoryGirl.define do
  factory :user do
#    first_name "user1"
#    last_name  "blabla"
#    email { "#{first_name}.#{last_name}@example.com".downcase }
   email "user@example.com"
   password "lalala"
#    admin false
  end

end

