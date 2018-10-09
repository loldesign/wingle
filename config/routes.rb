Rails.application.routes.draw do
  ########### CANDIDATES AREA ###########
  devise_for :candidates, controllers: {
    sessions: 'candidates/sessions',
    registrations: 'candidates/registrations',
    passwords: 'candidates/passwords'
  }

  namespace :candidate, path: "candidato" do
    get   '/user-login'                 , to: 'steps#login_or_register' , as: :login_or_register
    get   '/termos'                     , to: 'steps#terms'             , as: :terms
    match '/detalhes-rapidos'           , to: 'steps#quick_details'     , as: :quick_details , via: [:get, :post]
    get   '/completar-registro'         , to: 'steps#complete_register' , as: :complete_register
    post  '/completar-registro'         , to: 'steps#create_candidate'  , as: :create_candidate
    get   '/boas-vindas'                , to: 'steps#welcome_message'   , as: :welcome_message
    get   '/dashboard'                  , to: 'dashboard#index'         , as: :dashboard

    ##### INTEREST SECTOR #####
    get   'interesse/passo-1'           , to: 'interest#first'        , as: :interest_step_1
    match 'interesse/passo-2'           , to: 'interest#second'       , as: :interest_step_2         , via: [:get, :post]
    match 'interesse/passo-3'           , to: 'interest#third'        , as: :interest_step_3         , via: [:get, :post]
    match 'interesse/passo-4'           , to: 'interest#fourth'       , as: :interest_step_4         , via: [:get, :post]
    match 'interesse/passo-5'           , to: 'interest#fifth'        , as: :interest_step_5         , via: [:get, :post]
    post  'interesse/passo-completo'    , to: 'interest#complete'     , as: :interest_step_complete

    ##### MAIN CANDIDATE AREA #####
    get  '/home'                        , to: 'main#home'             , as: :home
    get  '/perfil'                      , to: 'main#profile'          , as: :profile
    post '/atualizar-perfil'            , to: 'main#update_profile'   , as: :update_profile

    ##### EXPERIENCE SECTOR #####
    get   'experiencia/passo-1'         , to: 'experience#first'      , as: :experience_step_1
    match 'experiencia/passo-2'         , to: 'experience#second'     , as: :experience_step_2        , via: [:get, :post]
    match 'experiencia/passo-3'         , to: 'experience#third'      , as: :experience_step_3        , via: [:get, :post]
    match 'experiencia/passo-4'         , to: 'experience#fourth'     , as: :experience_step_4        , via: [:get, :post]
    match 'experiencia/passo-5'         , to: 'experience#fifth'      , as: :experience_step_5        , via: [:get, :post]
    match 'experiencia/passo-6'         , to: 'experience#sixth'      , as: :experience_step_6        , via: [:get, :post]
    match 'experiencia/passo-7'         , to: 'experience#seventh'    , as: :experience_step_7        , via: [:get, :post]
    post  'experiencia/passo-completo'  , to: 'experience#complete'   , as: :experience_step_complete

    #### COMPANY SECTOR #####
    get   'empresa/passo-1'             , to: 'company#first'         , as: :company_step_1
    match 'empresa/passo-2'             , to: 'company#second'        , as: :company_step_2           , via: [:get, :post]
    match 'empresa/passo-3'             , to: 'company#third'         , as: :company_step_3           , via: [:get, :post]
    post  'empresa/passo-completo'      , to: 'company#complete'      , as: :company_step_complete

    #### HABILITY SECTOR #####
    get  'habilidade/passo-1'           , to: 'hability#first'        , as: :hability_step_1
    post 'habilidade/passo-completo'    , to: 'hability#complete'     , as: :hability_step_complete

    #### EDUCATION SECTOR #####
    get   'educacao/passo-1'            , to: 'education#first'       , as: :education_step_1
    match 'educacao/passo-2'            , to: 'education#second'      , as: :education_step_2          , via: [:get, :post]
    post  'educacao/passo-completo'     , to: 'education#complete'    , as: :education_step_complete

    #### PRETENSION SECTOR #####
    get   'pretensao/passo-1'           , to: 'pretension#first'      , as: :pretension_step_1
    match 'pretensao/passo-2'           , to: 'pretension#second'     , as: :pretension_step_2         , via: [:get, :post]
    match 'pretensao/passo-3'           , to: 'pretension#third'      , as: :pretension_step_3         , via: [:get, :post]
    post  'pretensao/complete'          , to: 'pretension#complete'   , as: :pretension_step_complete
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

  get '/admin', to: 'admin/areas#index'

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
