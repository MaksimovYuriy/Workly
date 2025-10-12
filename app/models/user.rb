class User < ApplicationRecord
    has_secure_password

    has_one :resume
    has_many :reviews
    has_many :responses
end
