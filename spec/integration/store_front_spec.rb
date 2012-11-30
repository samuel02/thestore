require 'spec_helper'

describe 'store front as customer' do

  it 'displays the correct store front' do
    get '/'
    assert_response :success
    assert_select 'div.products-display'
    assert_have_no_selector "a", :href => '/products'
    assert_contain "Cart"
  end

end