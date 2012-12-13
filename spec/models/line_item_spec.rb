require 'spec_helper'

describe LineItem do

  it { should belong_to :cart}

  context "validations" do
    it { should validate_presence_of :product_id }
    it { should validate_presence_of :cart_id }
    it { should validate_presence_of :amount }
  end
end
