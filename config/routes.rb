Rails.application.routes.draw do

  get 'login_page/home', to: 'login_page#home'
  get 'login-proyecto', to: 'project_sessions#new', as: :login_project
  get 'login-juez', to: 'judge_sessions#new', as: :login_judge

  resources :evaluations
  resources :questions
  resources :judges
  resources :professors
  resources :students
  resources :projects

  get 'signup-proyecto', to: 'projects#new', as: :signup_project
  post 'signup-proyecto', to: 'projects#create'
end
