class User < ApplicationRecord
    has_many :plantcollections
    has_many :plantcards, through: :plantcollections
    has_many :canvas
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
