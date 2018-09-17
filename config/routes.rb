Rails.application.routes.draw do
  get 'login_page/home'
  resources :evaluations
  resources :questions
  resources :judges
  resources :professors
  resources :projects
  resources :students
  root 'application#hello'
end
