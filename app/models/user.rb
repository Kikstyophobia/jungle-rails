class User < ApplicationRecord
  
  has_secure_password
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :name, presence: true
  validates :password, length: { minimum: 4 } 
  

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)

    if user && user.authenticate(password)
      user
    else
      nil
    end

  end
  
end
