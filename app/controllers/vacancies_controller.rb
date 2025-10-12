class VacanciesController < ApplicationController
  def index
    vacancies = VacancyResource.all(params)
    respond_with(vacancies)
  end

  def show
    vacancy = VacancyResource.find(params)
    respond_with(vacancy)
  end

  def create
    vacancy = VacancyResource.build(params)

    if vacancy.save
      render jsonapi: vacancy, status: 201
    else
      render jsonapi_errors: vacancy
    end
  end

  def update
    vacancy = VacancyResource.find(params)

    if vacancy.update_attributes
      render jsonapi: vacancy
    else
      render jsonapi_errors: vacancy
    end
  end

  def destroy
    vacancy = VacancyResource.find(params)

    if vacancy.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: vacancy
    end
  end
end
