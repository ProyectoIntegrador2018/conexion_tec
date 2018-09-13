Rails.application.routes.draw do
  resources :evaluations
  resources :questions
  resources :judges
  resources :professors
  resources :projects
  resources :students
  get 'login-proyecto', to: 'project_sessions#new'
  get 'login-juez', to: 'judge_sessions#new'
  root 'application#hello'
end
