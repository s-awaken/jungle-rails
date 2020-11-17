class User < ActiveRecord::Base
  has_secure_password
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, length: {minimum: 5}

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password,presence:true

  validates :password_confirmation,presence:true

  before_save :lower_case
  def self.authenticate_with_credentials(email,password)
    # email_no_space = email.strip;
    # user =  User.where("lower(email) = ?",email_no_space.downcase).first
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      # user.authenticate(password)
      return user
    else 
      return nil
    end
    
  end

  def lower_case
    self.email.downcase!
  end


end
