require 'spec_helper'

describe Admin do

  it 'should be possible to authenticate an admin' do
    admin = FactoryGirl.create(:admin)
    Admin.authenticate(admin.email, '123456').should == admin
  end

  context "validations" do

    it 'should require an emailadress' do
      FactoryGirl.build(:admin, :email => '').should_not be_valid
    end

    it 'should require the password and the password confirmation to be equal' do
      FactoryGirl.build(:admin, :password_confirmation => '12').should_not be_valid
    end

    it 'should require a (somewhat) valid emailadress' do
      FactoryGirl.build(:admin, :email => 'samuel').should_not be_valid
    end
  end
end