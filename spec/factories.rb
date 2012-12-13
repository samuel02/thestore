FactoryGirl.define do

  factory :product do
    name "Testproduct"
    description "This is a description of the Testproduct."
    price "1200.00"
  end

  factory :admin do
    email "samuel02@gmail.com"
    password "123456"
    password_confirmation "123456"
  end

end