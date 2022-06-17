Rails.application.routes.draw do
  resources :tasks
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  devise_for :users
  resources :categories

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
