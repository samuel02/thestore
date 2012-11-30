require 'spec_helper'

describe AdminsController do

  def valid_attributes
    {
      :email => 'test@testing.com',
      :password => '123456',
      :password_confirmation => '123456'
    }
  end

  def valid_session
    {}
  end

  describe "GET new" do
    it "assigns a new admin as @admin" do
      get :new, {}, valid_session
      assigns(:admin).should be_a_new(Admin)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Admin" do
        expect {
          post :create, {:admin => valid_attributes}, valid_session
        }.to change(Admin, :count).by(1)
      end

      it "assigns a newly created admin as @admin" do
        post :create, {:admin => valid_attributes}, valid_session
        assigns(:admin).should be_a(Admin)
        assigns(:admin).should be_persisted
      end

      it "redirects to root" do
        post :create, {:admin => valid_attributes}, valid_session
        response.should redirect_to :root
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin as @admin" do
        Admin.any_instance.stub(:save).and_return(false)
        post :create, {:admin => {}}, valid_session
        assigns(:admin).should be_a_new(Admin)
      end

      it "re-renders the 'new' template" do
        Admin.any_instance.stub(:save).and_return(false)
        post :create, {:admin => {}}, valid_session
        response.should render_template("new")
      end
    end
  end
end
