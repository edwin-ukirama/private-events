Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events do
    get 'attend', to: 'events#attend_event'
    get 'cancel-attend', to: 'events#remove_attendance'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
