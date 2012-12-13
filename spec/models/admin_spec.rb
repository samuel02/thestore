require 'spec_helper'

describe Admin do

  it 'should be possible to authenticate an admin' do
    admin = FactoryGirl.create(:admin)
    Admin.authenticate(admin.email, '123456').should == admin
  end

  context "validations" do

    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }

    it { should validate_presence_of :email }

    it 'should require a (somewhat) valid emailadress' do
      FactoryGirl.build(:admin, :email => 'samuel').should_not be_valid
    end
  end
end