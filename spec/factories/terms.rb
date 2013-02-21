# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :term do
    name "MyString"
    parent_id 1
    taxonomy_name "MyString"
  end
end
