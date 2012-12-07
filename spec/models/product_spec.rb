require 'spec_helper'

describe Product do

  let(:product) { FactoryGirl.build(:product) }
  subject(:product)
  it { should respond_to :name }

end
