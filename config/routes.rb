Rails.application.routes.draw do
  ########### CANDIDATES AREA ###########
  devise_for :candidates, controllers: {
    sessions: 'candidates/sessions',
    registrations: 'candidates/registrations',
    passwords: 'candidates/passwords'
  }

  namespace :candidate do
    get '/user-login'         , to: 'steps#login_or_register'
    get '/terms'              , to: 'steps#terms'
    get '/quick-details'      , to: 'steps#quick_details'
    get '/complete-register'  , to: 'steps#complete_register'
    get '/welcome-message'    , to: 'steps#welcome_message'
    get '/step-1'             , to: 'steps#first'
    get '/step-2'             , to: 'steps#second'
    get '/step-3'             , to: 'steps#third'
    get '/step-4'             , to: 'steps#fourth'
    get '/step-5'             , to: 'steps#fifth'
    get '/dashboard'          , to: 'dashboard#index', as: :dashboard
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
    resources :admins,                  path: :administradores
    resources :positions,               path: :cargos
    resources :specialties,             path: :especialidades
    resources :translations,            path: :translations
    resources :terms,                   path: :termos
    resources :package_services,        path: :'pacotes-de-servico'
    resources :locales,                 path: :localidades
    resources :sectors,                 path: :setores
    resources :company_sizes,           path: :portes
    resources :modes,                   path: :modes
    resources :relevances,              path: :relevancias
    resources :title_lists,             path: :'lista-de-titulos'
    resources :range_lists,             path: :'lista-de-alcances'
    resources :education_lists,         path: :'lista-de-escolaridades'
    resources :language_lists,          path: :'lista-de-linguas'
    resources :language_level_lists,    path: :'lista-de-niveis_linguas'
    resources :nofsalaries_lists,       path: :'lista-de-nofsalaries'
    resources :benefits_lists,          path: :'lista-de-beneficios'
    resources :annual_claim_rate_lists, path: :'lista-de-reivindicacoes'
    resources :status_lists,            path: :'lista-de-status'
    resources :step_lists,              path: :'lista-de-etapas'
    resources :sort_lists,              path: :'lista-de-odernações'
    resources :areas,                   path: :areas  do
      resources :functions, path: :funcoes do
        resources :habilities, path: :habilidades
      end
    end
    resources :states,                  path: :estados do
      resources :cities, path: :cidades do
        resources :neighborhoods, path: :bairros
        resources :city_locales, path: :'regiões-da-cidade'
      end
    end
  end

  root 'landing_page#session_type'
end
