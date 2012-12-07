require 'spec_helper'

describe Product do

  let(:product) { FactoryGirl.build(:product) }
  subject(:product)
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :price }
  it { should respond_to :quantity }

end
