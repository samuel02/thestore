require 'spec_helper'

describe ProductsController do

  before(:each) do
    controller.stub!(:authorize_admin).and_return(true)
  end

  describe "GET index" do
    it "assigns all products as @products" do
      product = FactoryGirl.create(:product)
      get :index, {}
      assigns(:products).should eq([product])
    end
  end

  describe "GET show" do
    it "assigns the requested product as @product" do
      product = FactoryGirl.create(:product)
      get :show, {:id => product.to_param}
      assigns(:product).should eq(product)
    end
  end

  describe "GET new" do
    it "assigns a new product as @product" do
      get :new, {}
      assigns(:product).should be_a_new(Product)
    end
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      product = FactoryGirl.create(:product)
      get :edit, {:id => product.to_param}
      assigns(:product).should eq(product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, {:product => FactoryGirl.attributes_for(:product)}
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, {:product => FactoryGirl.attributes_for(:product)}
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the created product" do
        post :create, {:product => FactoryGirl.attributes_for(:product)}
        response.should redirect_to(Product.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        Product.any_instance.stub(:save).and_return(false)
        post :create, {:product => FactoryGirl.attributes_for(:product, :name => '')}
        assigns(:product).should be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        Product.any_instance.stub(:save).and_return(false)
        post :create, {:product => FactoryGirl.attributes_for(:product, :name => '')}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product" do
        product = FactoryGirl.create(:product)
        Product.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => product.to_param, :product => {'these' => 'params'}}
      end

      it "assigns the requested product as @product" do
        product = FactoryGirl.create(:product)
        put :update, {:id => product.to_param, :product => FactoryGirl.build(:product)}
        assigns(:product).should eq(product)
      end

      it "redirects to the product" do
        product = FactoryGirl.create(:product)
        put :update, {:id => product.to_param, :product => FactoryGirl.build(:product)}
        response.should redirect_to(product)
      end
    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        product = FactoryGirl.create(:product)
        Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :product => {}}
        assigns(:product).should eq(product)
      end

      it "re-renders the 'edit' template" do
        product = FactoryGirl.create(:product)
        Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :product => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product" do
      product = FactoryGirl.create(:product)
      expect {
        delete :destroy, {:id => product.to_param}
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = FactoryGirl.create(:product)
      delete :destroy, {:id => product.to_param}
      response.should redirect_to(products_url)
    end
  end

end
