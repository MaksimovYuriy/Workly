class TagResource < ApplicationResource 
    attribute :id, :integer
    attribute :name, :integer

    has_many :vacancy_tags

end
