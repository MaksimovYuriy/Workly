class ReviewResource < ApplicationResource
    attribute :id, :integer
    attribute :description, :string
    attribute :rate, :integer
    attribute :employer_id, :integer
    attribute :user_id, :integer

    belongs_to :employer
    belongs_to :user

end
