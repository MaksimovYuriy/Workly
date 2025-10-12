class ResumeResource < ApplicationResource
    attribute :id, :integer
    attribute :description, :string
    
    belongs_to :user

end
