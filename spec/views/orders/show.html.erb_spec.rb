require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :adress => "Adress",
      :postal_code => "Postal Code",
      :city => "City"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Adress/)
    rendered.should match(/Postal Code/)
    rendered.should match(/City/)
  end
end
