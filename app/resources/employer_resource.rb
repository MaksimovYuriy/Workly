class EmployerResource < ApplicationResource
    attribute :id, :integer
    attribute :name, :string
    attribute :description, :string

    has_many :reviews
    has_many :vacancies

end
