class Employer < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :vacancies

    def generate_jwt
        JwtService.new(:encode, id: id, name: name, description: description).call
    end

    def self.from_jwt(token)
        payload = JwtService.new(:decode, token: token).call
        find_by(id: payload[:id], name: payload[:name]) if payload
    end
end
