class AuthController < ApplicationController
    skip_before_action :authenticate!

    def sign_in_user
        user = User.find_by(email: sign_in_params[:email])

        if user&.authenticate(sign_in_params[:password])
            token = user.generate_jwt
            render json: successful_response(token, 'user', user.id)
        else
            render json: error_response, status: :unauthorized
        end
    end

    def sign_up_user
        user = User.new(sign_up_params)

        if user.save
            token = user.generate_jwt
            render json: successful_response(token, 'user', user.id), status: :created
        else
            render json: validation_error_response(user), status: :unprocessable_entity
        end
    end

    def sign_in_employer
        employer = Employer.find_by(name: sign_in_params[:name])

        if employer&.authenticate(sign_in_params[:password])
            token = employer.generate_jwt
            render json: successful_response(token, 'company', employer.id)
        else
            render json: error_response, status: :unauthorized
        end
    end

    def sign_up_employer
        employer = Employer.new(sign_up_params)

        if employer.save
            token = employer.generate_jwt
            render json: successful_response(token, 'company', employer.id), status: :created
        else
            render json: validation_error_response(employer), status: :unprocessable_entity
        end
    end

    private

    def sign_in_params
        params.require(:data).require(:attributes).permit(:email, :name, :password)
    end

    def sign_up_params
        params.require(:data).require(:attributes).permit(:email, :name, :password, :password_confirmation)
    end

    def successful_response(token, role, resource_id)
        {
            data: {
                type: :auth,
                attributes: {
                    token: token,
                    role: role,
                    resource_id: resource_id.to_s,
                    message: "Successful"
                }
            }
        }
    end

    def error_response
        {
            data: {
                type: :auth,
                attributes: {
                    message: "Invalid credentials"
                }
            }
        }
    end

end