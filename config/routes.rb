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


  # resources :evaluations
  # resources :questions
  # resources :projects

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
    post '/projects/approve/:id', to: "projects#approve", as: :approve_project
    post '/projects/reject/:id', to: "projects#reject", as: :reject_project
    resources 'projects'
  end

  namespace :admin do
    get 'profile', to: 'profile#show'
    get 'profile/edit', to: 'profile#edit'
    patch 'profile/edit', to: 'profile#update'
    put 'user/authorize/:id', to: 'users#authorize', as: :authorize_user
    resources :users
  end

  namespace :committee do
    get 'profile', to: 'profile#index'
    resources :committees
  end

  namespace :student do
    resources 'projects'
  end

  namespace :common do
    resources :assignments
    resources :operatives
    put 'operative/authorize/:id', to: 'operatives#authorize', as: :authorize_user

    resources :projects

    resources :projects do
      resources :project_grades
    end
    get 'judges', to: 'judges#index'
    post 'judges/:id/edit', to: 'judges#update'
    resources 'judges', only: [:edit, :update, :destroy]
    get 'evaluations', to: 'evaluations#index'
    resources 'evaluations', only: [:destroy]
    get 'questions', to: 'questions#index'
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
    post '/projects/accept/:id', to: "projects#accept", as: :accept_project
    post '/projects/reject/:id', to: "projects#reject", as: :reject_project
    post '/judges/approve/:id', to: "judges#approve", as: :approve_judge
    post '/judges/reject/:id', to: "judges#reject", as: :reject_judge
    get '/projects_assistance', to: 'projects_assistance#index', as: :projects_assistance
    post '/projects_assistance/mark_assistance:id', to: 'projects_assistance#mark_assistance', as: :project_mark_assistance
    post '/projects_assistance/block:id', to: 'projects_assistance#block', as: :project_block
    get '/judges_assistance', to: 'judges_assistance#index', as: :judges_assistance
    post '/judges_assistance/mark_assistance:id', to: 'judges_assistance#mark_assistance', as: :judge_mark_assistance
    get '/stands_assignment', to: 'stands_assignment#index', as: :stands_assignment
    patch '/stands_assignment/assignStand:id', to: 'stands_assignment#assignStand', as: :assign_stand
    resources :expertise_areas
    resources :clients
    resources :majors
    resources :fields
    resources :departments
    resources :editions
    resources :categories
    resources :stands
  end

  root 'main_screen#main'
end
