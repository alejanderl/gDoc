# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address "MyString"
    postcode "MyString"
    city "MyString"
    country "MyString"
    addressable_id 1
    addresable_type "MyString"
  end
end
