Rails.application.routes.draw do
  ########### CANDIDATES AREA ###########
  devise_for :candidates, controllers: {
    sessions: 'candidates/sessions',
    registrations: 'candidates/registrations',
    passwords: 'candidates/passwords'
  }

  namespace :candidate do
    get '/dashboard', to: 'dashboard#index', as: :dashboard
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
    resources :admins,                path: :administradores
    resources :positions,             path: :cargos
    resources :specialties,           path: :especialidades
    resources :translations,          path: :translations
    resources :terms,                 path: :termos
    resources :package_services,      path: :pacotes_de_servico
    resources :locales,               path: :localidades
    resources :sectors,               path: :setores
    resources :company_sizes,         path: :portes
    resources :modes,                 path: :modes
    resources :relevances,            path: :relevancias
    resources :title_lists,           path: :lista_de_titulos
    resources :range_lists,           path: :lista_de_alcances
    resources :education_lists,       path: :lista_de_escolaridades
    resources :language_lists,        path: :lista_de_linguas
    resources :language_level_lists,    path: :lista_de_niveis_linguas
    resources :nofsalaries_lists,       path: :lista_de_nofsalaries
    resources :benefits_lists,          path: :lista_de_beneficios
    resources :annual_claim_rate_lists, path: :lista_de_reinvidicacoes
    resources :areas,                   path: :areas  do
      resources :functions do
        resources :habilities
      end
    end
  end

  root 'admin/admins#index'
end
