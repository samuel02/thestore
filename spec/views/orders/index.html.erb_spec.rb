require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :adress => "Adress",
        :postal_code => "Postal Code",
        :city => "City"
      ),
      stub_model(Order,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :adress => "Adress",
        :postal_code => "Postal Code",
        :city => "City"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Adress".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end
end
