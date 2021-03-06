Rails.application.routes.draw do
  get 'tasks/index'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
    get 'tasks/new', to: 'tasks#new'
    post 'tasks/create', to: 'tasks#create'
    get 'tasks/index', to: 'tasks#index'
    get 'tasks/:id', to: 'tasks#show', as: :task
    get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
    post 'tasks/:id/update', to: 'tasks#update', as: :update_task
    post 'tasks/:id/destroy', to: 'tasks#destroy', as: :destroy_task
end
