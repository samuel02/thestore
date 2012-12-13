require 'spec_helper'

describe PagesController do

  def valid_session
    {}
  end

  describe 'GET index' do
    it 'assigns all products as @products' do
      product = FactoryGirl.create(:product)
      get :index, {}, valid_session
      assigns(:products).should eq([product])
    end
  end

end
