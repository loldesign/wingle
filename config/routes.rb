Rails.application.routes.draw do
  ########### CANDIDATES AREA ###########
  devise_for :candidates, controllers: {
    sessions: 'candidates/sessions',
    registrations: 'candidates/registrations',
    passwords: 'candidates/passwords'
  }

  namespace :candidate do
    get   '/user-login'         , to: 'steps#login_or_register'
    get   '/terms'              , to: 'steps#terms'
    match '/quick-details'      , to: 'steps#quick_details', via: [:get, :post]
    get   '/complete-register'  , to: 'steps#complete_register'
    post  '/complete-register'  , to: 'steps#create_candidate'
    get   '/welcome-message'    , to: 'steps#welcome_message'
    get   '/dashboard'          , to: 'dashboard#index'    , as: :dashboard

    ##### INTEREST SECTOR #####
    get   'interest/step-1'           , to: 'interest#first'
    match 'interest/step-2'           , to: 'interest#second'       , via: [:get, :post]
    match 'interest/step-3'           , to: 'interest#third'        , via: [:get, :post]
    match 'interest/step-4'           , to: 'interest#fourth'       , via: [:get, :post]
    match 'interest/step-5'           , to: 'interest#fifth'        , via: [:get, :post]
    post  'interest/step-complete'    , to: 'interest#complete'

    ##### MAIN CANDIDATE AREA #####
    get '/home'                  , to: 'main#home', as: :home

    ##### EXPERIENCE SECTOR #####
    get 'experience/step-1'             , to: 'experience#first'
    get 'experience/step-2'             , to: 'experience#second'
    get 'experience/step-3'             , to: 'experience#third'
    get 'experience/step-4'             , to: 'experience#fourth'
    get 'experience/step-5'             , to: 'experience#fifth'
    get 'experience/step-6'             , to: 'experience#sixth'
    get 'experience/step-7'             , to: 'experience#seventh'

    ##### COMPANY SECTOR #####
    # get 'company/step-1'             , to: 'company#first'
    # get 'company/step-2'             , to: 'company#second'
    # get 'company/step-3'             , to: 'company#third'
    # get 'company/step-4'             , to: 'company#fourth'
    # get 'company/step-5'             , to: 'company#fifth'
    # get 'company/step-6'             , to: 'company#sixth'
    # get 'company/step-7'             , to: 'company#seventh'

    ##### HABILITY SECTOR #####
    # get 'hability/step-1'             , to: 'hability#first'
    # get 'hability/step-2'             , to: 'hability#second'
    # get 'hability/step-3'             , to: 'hability#third'
    # get 'hability/step-4'             , to: 'hability#fourth'
    # get 'hability/step-5'             , to: 'hability#fifth'
    # get 'hability/step-6'             , to: 'hability#sixth'
    # get 'hability/step-7'             , to: 'hability#seventh'

    ##### EDUCATION SECTOR #####
    # get 'education/step-1'             , to: 'education#first'
    # get 'education/step-2'             , to: 'education#second'
    # get 'education/step-3'             , to: 'education#third'
    # get 'education/step-4'             , to: 'education#fourth'
    # get 'education/step-5'             , to: 'education#fifth'
    # get 'education/step-6'             , to: 'education#sixth'
    # get 'education/step-7'             , to: 'education#seventh'

    ##### PRETENSION SECTOR #####
    # get 'pretension/step-1'             , to: 'pretension#first'
    # get 'pretension/step-2'             , to: 'pretension#second'
    # get 'pretension/step-3'             , to: 'pretension#third'
    # get 'pretension/step-4'             , to: 'pretension#fourth'
    # get 'pretension/step-5'             , to: 'pretension#fifth'
    # get 'pretension/step-6'             , to: 'pretension#sixth'
    # get 'pretension/step-7'             , to: 'pretension#seventh'
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
