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
  post 'logout-administrador', to: 'administrator_session#destroy', as: :logout_admin

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
    get 'projects', to: 'projects#index'
    get 'evaluations/project/:id', to: 'evaluations#show', as: :evaluation_project
    post 'evaluations/project/:id', to: 'evaluations#submit', as: :evaluation_project_submit
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
    get 'judges', to: 'judges#index'
    resources 'judges', only: [:destroy]
    get 'evaluations', to: 'evaluations#index'
    resources 'evaluations', only: [:destroy]
    get 'questions', to: 'questions#show'
    get 'questions/new', to: 'questions#new'
    post 'questions/new', to: 'questions#create'
    resources 'questions', only: [:edit, :update, :destroy]
    get 'statistics/projects_category', to: 'statistics#projects_category'
    get 'statistics/judges_expertise_areas', to: 'statistics#judges_expertise_areas'
    get 'statistics/projects_score', to: 'statistics#projects_score'
    get 'statistics/projects_score_category', to: 'statistics#projects_score_category'
    get 'event_dates', to: 'event_dates#index'
    get 'event_dates/new', to: "event_dates#new"
    post 'event_dates/new', to: "event_dates#create"
    delete 'event_dates/:id', to: "event_dates#destroy", as: :event_dates_destroy
    resources :expertise_areas
    resources :clients
    resources :editions
  end

  namespace :monitor do
	  get 'projects', to: 'evaluation#index'
	  patch 'evaluation', to: 'evaluation#update'
  end

  namespace :staff do
    resources :judges, only: [:index, :show, :create, :update]
  end

  root 'main_screen#main'
end
