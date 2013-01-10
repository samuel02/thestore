# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    first_name "MyString"
    last_name "MyString"
    address "MyString"
    postal_code "MyString"
    city "MyString"
    email "MyString"
    password_hash "MyString"
    password_salt "MyString"
  end
end
