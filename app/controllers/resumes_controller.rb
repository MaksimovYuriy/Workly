class ResumesController < ApplicationController
  def index
    resumes = ResumeResource.all(params)
    respond_with(resumes)
  end

  def show
    resume = ResumeResource.find(params)
    respond_with(resume)
  end

  def create
    resume = ResumeResource.build(params)

    if resume.save
      render jsonapi: resume, status: 201
    else
      render jsonapi_errors: resume
    end
  end

  def update
    resume = ResumeResource.find(params)

    if resume.update_attributes
      render jsonapi: resume
    else
      render jsonapi_errors: resume
    end
  end

  def destroy
    resume = ResumeResource.find(params)

    if resume.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: resume
    end
  end
end
