class User < ApplicationRecord
    has_secure_password
    has_many :enquiries
    validate :username, presence: true, uniqueness: true
    validate :email, presence: true, uniqueness: true
    validate :first_name, presence: true
    validate :last_name, presence: true
end
