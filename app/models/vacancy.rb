class Vacancy < ApplicationRecord
  belongs_to :employer
  has_many :responses
  has_many :vacancy_tags
end
