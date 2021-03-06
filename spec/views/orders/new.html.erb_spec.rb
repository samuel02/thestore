require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :adress => "MyString",
      :postal_code => "MyString",
      :city => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_first_name", :name => "order[first_name]"
      assert_select "input#order_last_name", :name => "order[last_name]"
      assert_select "input#order_email", :name => "order[email]"
      assert_select "input#order_adress", :name => "order[adress]"
      assert_select "input#order_postal_code", :name => "order[postal_code]"
      assert_select "input#order_city", :name => "order[city]"
    end
  end
end
