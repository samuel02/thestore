# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    adress "MyString"
    postal_code "MyString"
    city "MyString"
  end
end
