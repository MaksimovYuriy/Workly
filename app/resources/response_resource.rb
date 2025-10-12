class ResponseResource < ApplicationResource
    attribute :id, :integer
    attribute :user_id, :integer
    attribute :vacancy_id, :integer

    belongs_to :user
    belongs_to :vacancy

end
