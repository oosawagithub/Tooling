Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #デバイスのviewを編集するため↓
  devise_for :admins,controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
  	resources :posts, only: [:index, :show]
    resources :comments, only: [:destroy]
    resources :categories, only: [:new, :create, :show]
  end

  #devise_for :admins

  resources :posts, only: [:index, :new, :create, :update, :destroy, :show, :edit] do
    resource :comments, only:[:create, :destroy]
  end

  resources :categories, only: [:new, :create, :show]

  #email
  resources :inquiries, only: [:new, :create,:show]

  #email返信
  get 'admins/inquiries/index' => 'inquiries#admin_index'
  get 'admins/inquiries/:id' => 'inquiries#admin_show',as: "admin_show"

  root "posts#index"

end
