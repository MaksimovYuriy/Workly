class Vacancy < ApplicationRecord
  belongs_to :employer
  has_many :responses
  has_many :vacancy_tags
  has_many :tags, through: :vacancy_tags
end
