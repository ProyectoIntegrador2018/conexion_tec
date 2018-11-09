Rails.application.routes.draw do

  # resources :judge_sessions, only: [:new, :destroy, :create]
  # resources :project_sessions, only: [:new, :destroy, :create]
  # resources :administrator_sessions, only: [:new, :destroy, :create]
  # resources :monitor_sessions, only: [:new, :destroy, :create]
  # resources :staff_sessions, only: [:new, :destroy, :create]

  get 'login-proyecto', to: 'project_sessions#new', as: :login_project
  post 'login-proyecto', to: 'project_sessions#create'
  get 'login-juez', to: 'judge_sessions#new', as: :login_judge
  post 'login-juez', to: 'judge_sessions#create'
  get 'login-administrador', to: 'administrator_session#new', as: :login_admin
  post 'login-administrador', to: 'administrator_session#create', as: :login_admin_create

  get 'login-staff', to: 'staff_sessions#new', as: :login_staff
  post 'login-staff', to: 'staff_sessions#create'
  get 'login-monitor', to: 'monitor_sessions#new', as: :login_monitor
  post 'login-monitor', to: 'monitor_sessions#create'

  resources :evaluations
  resources :questions
  resources :judges
  resources :professors
  resources :students
  resources :projects
  resources :staffs, only: [:new, :create, :destroy]

  get 'signup-proyecto', to: 'projects#new', as: :signup_project
  post 'signup-proyecto', to: 'projects#create'

  get 'signup-juez', to: 'judges#new', as: :signup_judge
  post 'signup-juez', to: 'judges#create'

  get 'signup-staff', to: 'staffs#new'
  post 'signup-staff', to: 'staffs#create'

  namespace :judge do
    get 'profile', to: 'profile#show'
    resources 'judges'
  end

  namespace :project do
    get 'profile', to: 'profile#show'
    get 'profile/edit', to: 'profile#edit'
    patch 'profile/edit', to: 'profile#update'
  end

  namespace :admin do
    get 'profile', to: 'profile#show'
    get 'profile/edit', to: 'profile#edit'
    patch 'profile/edit', to: 'profile#update'
    resources 'projects'
  end

  namespace :monitor do
	  get 'projects', to: 'evaluation#index'
	  patch 'evaluation', to: 'evaluation#update'
  end

  namespace :staff do
    resources :assignments, only: [:index, :show, :create, :update]
    resources :judges, only: [:create, :update]
  end

  root 'main_screen#main'
end
