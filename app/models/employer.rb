class Employer < ApplicationRecord
    has_many :reviews
    has_many :vacancies
end
