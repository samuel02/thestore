# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    product_id 1
    customer_id 1
    rating "9.99"
    comment "MyText"
    parent_id 1
  end
end
