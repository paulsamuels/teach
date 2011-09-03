class User < ActiveRecord::Base
  
  attr_accessible :email, :user_password, :user_password_confirmation
  attr_accessor :user_password
  
  validates_confirmation_of :user_password
  validates_presence_of :user_password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
      
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user.password == password
      user
    end
  end
  
end
