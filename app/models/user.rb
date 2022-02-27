class User < ApplicationRecord

    require "securerandom"

    has_many :notes

    has_secure_password
    
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
