Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :recipes, only: [:index, :show]
  resources :users, only: [:new, :create] do
    resources :recipes, only: [:index, :show, :new, :edit]
  end
end
