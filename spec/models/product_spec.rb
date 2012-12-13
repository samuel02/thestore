require 'spec_helper'

describe Product do

  let(:product) { FactoryGirl.build(:product) }
  subject(:product)

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :price }
  it { should respond_to :quantity }

  context "validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:price) }

  end

end
