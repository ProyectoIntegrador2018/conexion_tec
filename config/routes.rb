Rails.application.routes.draw do

  get 'login-proyecto', to: 'project_sessions#new', as: :login_project
  get 'login-juez', to: 'judge_sessions#new', as: :login_judge
  post 'login-juez', to: 'judge_sessions#create'
  get 'login-administrador', to: 'administrator_session#new', as: :login_admin
  post 'login-administrador', to: 'administrator_session#create', as: :login_admin_create
  post 'login-proyecto', to: 'project_sessions#create', as: :login_project_create

  resources :evaluations
  resources :questions
  resources :judges
  resources :professors
  resources :students
  resources :projects

  get 'signup-proyecto', to: 'projects#new', as: :signup_project
  post 'signup-proyecto', to: 'projects#create'

  get 'signup-juez', to: 'judges#new', as: :signup_judge
  post 'signup-juez', to: 'judges#create'

  root 'main_screen#main'
end
