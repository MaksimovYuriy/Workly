class VacancyTagResource < ApplicationResource
    attribute :id, :integer
    attribute :vacancy_id, :integer
    attribute :tag_id, :integer

    belongs_to :vacancy
    belongs_to :tag
end
