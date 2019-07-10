Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :new, :create, :update, :destroy, :show, :edit] do
    resource :comments, only:[:create, :destroy]
  end

  #resources :comments, only:[:destroy]

  resources :categories, only: [:new, :create, :show]

  root "posts#index"

end
