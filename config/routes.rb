Rails.application.routes.draw do

  # resources :judge_sessions, only: [:new, :destroy, :create]
  # resources :project_sessions, only: [:new, :destroy, :create]
  # resources :administrator_sessions, only: [:new, :destroy, :create]
  # resources :monitor_sessions, only: [:new, :destroy, :create]
  # resources :staff_sessions, only: [:new, :destroy, :create]
  
  # Admin session
  get 'login-administrador', to: 'administrator_session#new', as: :login_admin
  get 'authorize-admin', to: 'administrator_session#create'
  post 'logout-administrador', to: 'administrator_session#destroy', as: :logout_admin

  # Student session
  get 'login-estudiante', to: 'student_sessions#new', as: :login_student
  get 'authorize-student', to: 'student_sessions#create'
  post 'logout-estudiante', to: 'student_sessions#destroy', as: :logout_student

  # Operative session
  get 'login-operativo', to: 'operative_sessions#new', as: :login_operative
  get 'authorize-operative', to: 'operative_sessions#create'
  post 'logout-operativo', to: 'operative_sessions#destroy', as: :logout_operative

  # Professor session
  get 'login-profesor', to: 'professor_sessions#new', as: :login_professor
  get 'authorize-professor', to: 'professor_sessions#create'
  post 'logout-profesor', to: 'professor_sessions#destroy', as: :logout_professor

  # Judge session
  get 'login-juez', to: 'judge_sessions#new', as: :login_judge
  get 'authorize-judge', to: 'judge_sessions#create'
  post 'logout-juez', to: 'judge_sessions#destroy', as: :logout_judge

  # Committee session
  get 'login-comite', to: 'committee_sessions#new', as: :login_committee
  get 'authorize-committee', to: 'committee_sessions#create'
  post 'logout-comite', to: 'committee_sessions#destroy', as: :logout_committee


  resources :evaluations
  resources :questions
  resources :projects

  namespace :judge do
    get 'profile', to: 'profile#index'
    get 'edit', to: 'profile#edit'
    patch 'update', to: 'profile#update'
    resources 'judges'
    get 'projects', to: 'projects#index'
    resources :evaluations, onyl: [:new, :create]
  end

  namespace :student do
    get 'profile', to: 'profile#index'
    get 'edit', to: 'profile#edit'
    patch 'update', to: 'profile#update'
  end

  namespace :operative do
    get 'profile', to: 'profile#index'
  end

  namespace :professor do
    get 'profile', to: 'profile#index'
    get 'edit', to: 'profile#edit'
    patch 'update', to: 'profile#update'
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
    post '/projects/approve/:id', to: "projects#approve", as: :approve_project
    post '/projects/reject/:id', to: "projects#reject", as: :reject_project
    post '/judges/approve/:id', to: "judges#approve", as: :approve_judge
    post '/judges/reject/:id', to: "judges#reject", as: :reject_judge
    put 'user/authorize/:id', to: 'users#authorize', as: :authorize_user
    resources :expertise_areas
    resources :clients
    resources :majors
    resources :fields
    resources :departments
    resources :editions
    resources :categories
    resources :users
  end

  namespace :committee do

  end

  namespace :student do
    resources 'projects'
  end

  namespace :common do
    get '/assignments', to: 'assignments#index', as: :assignments
    post '/assignments', to: 'assignments#create', as: :create_assignment
    resources :operatives
    put 'operative/authorize/:id', to: 'operatives#authorize', as: :authorize_user
  end

  root 'main_screen#main'
end
