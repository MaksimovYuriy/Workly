class EmployersController < ApplicationController
  def index
    employers = EmployerResource.all(params)
    respond_with(employers)
  end

  def show
    employer = EmployerResource.find(params)
    respond_with(employer)
  end

  def create
    employer = EmployerResource.build(params)

    if employer.save
      render jsonapi: employer, status: 201
    else
      render jsonapi_errors: employer
    end
  end

  def update
    employer = EmployerResource.find(params)

    if employer.update_attributes
      render jsonapi: employer
    else
      render jsonapi_errors: employer
    end
  end

  def destroy
    employer = EmployerResource.find(params)

    if employer.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: employer
    end
  end
end
