class VacancyResource < ApplicationResource
  attribute :id, :integer
  attribute :head, :string
  attribute :description, :string

  # новые поля
  attribute :salary_from, :integer
  attribute :salary_to, :integer
  attribute :full_description, :string
  attribute :phone, :string
  attribute :email, :string
  attribute :website, :string

  attribute :employer_id, :integer

  belongs_to :employer
  has_many :responses
  has_many :vacancy_tags
  has_many :tags, through: :vacancy_tags

  filter :tag, :string do
    eq do |scope, value|
      scope.joins(:tags).where(tags: { name: value }).distinct
    end
  end
end

