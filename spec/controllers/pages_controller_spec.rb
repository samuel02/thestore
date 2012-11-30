require 'spec_helper'

describe PagesController do

  def valid_product_attributes
    {}
  end

  def valid_session
    {}
  end

  describe 'GET index' do
    it 'assigns all products as @products' do
      product = Product.create! valid_product_attributes
      get :index, {}, valid_session
      assigns(:products).should eq([product])
    end
  end

end
