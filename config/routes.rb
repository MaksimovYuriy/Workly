Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post '/auth/sign_in_user'
  post '/auth/sign_in_employer'

  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :tags
    resources :vacancy_tags
    resources :responses
    resources :vacancies
    resources :employers
    resources :reviews
    resources :resumes
    resources :users

  end
end
