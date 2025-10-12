class VacancyResource < ApplicationResource
    attribute :id, :integer
    attribute :head, :string
    attribute :description, :string
    attribute :employer_id, :integer

    belongs_to :employer
    has_many :responses
    has_many :vacancy_tags

end
