require 'spec_helper'

describe Admin do

  def valid_attributes
    {
      :email => 'test@testing.com',
      :password => '123456',
      :password_confirmation => '123456'
    }
  end

  describe "validations" do

    it 'should require an emailadress' do
      attributes = valid_attributes.merge( :email => '' )
      admin = Admin.new attributes
      admin.should_not be_valid
    end

    it 'should require the password and the password confirmation to be equal' do
      attributes valid_attributes.merge( :password_confirmation => '654321' )
      admin = Admin.new attributes
      admin.should_not be_valid
    end

    it 'should require a (somewhat) valid emailadress' do
      attributes = valid_attributes.merge( :email => 'test' )
      admin = Admin.new attributes
      admin.should_not be_valid
    end

  end

  it 'should be possible to authenticate an admin' do
    admin = Admin.create! valid_attributes
    Admin.authenticate('test@testing.com', '123456').should == admin
  end

end
