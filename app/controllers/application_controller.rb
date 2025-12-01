class ApplicationController < ActionController::API
    before_action :authenticate!

    include Graphiti::Rails::Responders

    private

    def authenticate!
        header = request.headers['Authorization']
        token = header&.split(' ')&.last

        if token
            @current_agent = User.from_jwt(token) || Employer.from_jwt(token)
        end

        render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_agent
    end
end
