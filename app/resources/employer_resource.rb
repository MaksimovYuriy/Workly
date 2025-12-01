class EmployerResource < ApplicationResource
    attribute :id, :integer
    attribute :name, :string
    attribute :description, :string
    attribute :password, :string, writable: true, readable: false
    attribute :password_confirmation, :string, writable: true, readable: false

    has_many :reviews
    has_many :vacancies
end
