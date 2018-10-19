Rails.application.routes.draw do

  resources :judge_sessions, only: [:new, :destroy, :create]
  resources :project_sessions, only: [:new, :destroy, :create]
  resources :administrator_sessions, only: [:new, :destroy, :create]

  get 'login-proyecto', to: 'project_sessions#new', as: :login_project
  post 'login-proyecto', to: 'project_sessions#create'
  get 'login-juez', to: 'judge_sessions#new', as: :login_judge
  post 'login-juez', to: 'judge_sessions#create'
  get 'login-administrador', to: 'administrator_session#new', as: :login_admin
  post 'login-administrador', to: 'administrator_session#create', as: :login_admin_create

  resources :evaluations
  resources :questions
  resources :judges
  resources :professors
  resources :students
  resources :projects, only: [:new, :create]

  get 'signup-proyecto', to: 'projects#new', as: :signup_project
  post 'signup-proyecto', to: 'projects#create'

  get 'signup-juez', to: 'judges#new', as: :signup_judge
  post 'signup-juez', to: 'judges#create'

  namespace :judge do
    get 'perfil', to: 'profile#show'
    get 'perfil/editar', to: 'profile#edit'
    post 'perfil/editar', to: 'profile#update'
  end

  namespace :project do
    get 'perfil', to: 'profile#show'
    get 'perfil/editar', to: 'profile#edit'
    patch 'perfil/editar', to: 'profile#update'
  end

  namespace :admin do
    get 'perfil', to: 'profile#show'
    get 'perfil/editar', to: 'profile#edit'
    post 'perfil/editar', to: 'profile#update'
  end

  root 'main_screen#main'
end
