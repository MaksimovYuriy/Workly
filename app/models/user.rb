class User < ApplicationRecord
    has_secure_password

    has_one :resume
    has_many :reviews
    has_many :responses

    def generate_jwt
        JwtService.new(:encode, id: id, email: email).call
    end

    def self.from_jwt(token)
        payload = JwtService.new(:decode, token: token).call
        find_by(id: payload[:id], email: payload[:email]) if payload
    end
end
