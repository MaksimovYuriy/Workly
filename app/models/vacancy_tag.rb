class VacancyTag < ApplicationRecord
  belongs_to :vacancy
  belongs_to :tag
end
