class UserResource < ApplicationResource
    attribute :id, :integer
    attribute :email, :string
    attribute :password, :string, writable: true, readable: false
    attribute :password_confirmation, :string, writable: true, readable: false

    has_one :resume
    has_many :reviews
    has_many :responses

end
