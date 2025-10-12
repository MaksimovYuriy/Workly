class VacancyTagsController < ApplicationController
  def index
    vacancy_tags = VacancyTagResource.all(params)
    respond_with(vacancy_tags)
  end

  def show
    vacancy_tag = VacancyTagResource.find(params)
    respond_with(vacancy_tag)
  end

  def create
    vacancy_tag = VacancyTagResource.build(params)

    if vacancy_tag.save
      render jsonapi: vacancy_tag, status: 201
    else
      render jsonapi_errors: vacancy_tag
    end
  end

  def update
    vacancy_tag = VacancyTagResource.find(params)

    if vacancy_tag.update_attributes
      render jsonapi: vacancy_tag
    else
      render jsonapi_errors: vacancy_tag
    end
  end

  def destroy
    vacancy_tag = VacancyTagResource.find(params)

    if vacancy_tag.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: vacancy_tag
    end
  end
end
