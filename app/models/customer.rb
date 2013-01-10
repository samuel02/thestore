class Customer < ActiveRecord::Base
  attr_accessible :address,
                  :city,
                  :email,
                  :first_name,
                  :last_name,
                  :password,
                  :password_confirmation,
                  :postal_code

  attr_accessor :password
  before_save :encrypt_password

  validates_presence_of :email,
                        :address,
                        :city,
                        :first_name,
                        :last_name,
                        :postal_code

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
  validates_format_of :email, :with => %r/\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  has_many :orders

  def self.authenticate(email, password)
    customer = find_by_email(email)
    if customer && customer.password_hash == BCrypt::Engine.hash_secret(password, customer.password_salt)
      customer
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def admin?; false; end
  def customer?; true; end
end
