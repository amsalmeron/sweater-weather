class User < ApplicationRecord 
    validates :email, uniqueness: true
    has_secure_password
    has_secure_token :auth_token
end