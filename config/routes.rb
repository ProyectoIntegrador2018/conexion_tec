Rails.application.routes.draw do
  resources :evaluations
  resources :questions
  resources :judges
  resources :professors
  resources :projects
  resources :students
  root 'main_screen#main'
end
