Rails.application.routes.draw do
  devise_for :admins
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

  root 'admin/admins#index'
end
