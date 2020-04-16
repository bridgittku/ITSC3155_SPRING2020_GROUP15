class User < ApplicationRecord
  has_many :articles
    
    VALID_EMAIL_REGEX = /A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    before_save { self.email = email.downcase }
    VAILID_PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])/

    
    validates :name,
        presence: true,
        length: { maximum: 12 }
    
    validates :email,
        presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
        
    validates :password,
        presence: true,
        length: { minimum: 6 },
        format: {with: VAILID_PASSWORD_REGEX},
        confirmation: true
        
    has_secure_password
end
