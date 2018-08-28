Rails.application.routes.draw do
  ########### CANDIDATES AREA ###########
  devise_for :candidates, controllers: {
    sessions: 'candidates/sessions',
    registrations: 'candidates/registrations',
    passwords: 'candidates/passwords'
  }

  namespace :candidate do
    get '/dashboard', to: 'dashboard#index', as: :dashboard
    get '/step-1'   , to: 'steps#first'
    get '/step-2'   , to: 'steps#second'
    get '/step-3'   , to: 'steps#third'
    get '/step-4'   , to: 'steps#fourth'
    get '/step-5'   , to: 'steps#fifth'
  end


  ########### COMPANIES AREA ###########
  devise_for :companies, controllers: {
    sessions: 'companies/sessions',
    registrations: 'companies/registrations',
    passwords: 'companies/passwords'
  }

  namespace :company do
    get '/dashboard', to: 'dashboard#index', as: :dashboard
  end


  ########### ADMINS AREA ###########
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }

  mount LoldesignPublisher::Rails::Engine => '/'

  namespace :admin do
    resources :admins,           path: :administradores
    resources :positions,        path: :cargos
    resources :specialties,      path: :especialidades
    resources :questionaries,    path: :questionarios
    resources :translations,     path: :translations
    resources :terms,            path: :termos
    resources :package_services, path: :pacotes_de_servico
    resources :locales,          path: :localidades
  end

  root 'landing_page#session_type'
end
