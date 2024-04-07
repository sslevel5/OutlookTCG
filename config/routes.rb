Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about', as: 'about'
  get '/home', to: 'public/homes#home', as: 'home'

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  post '/customers/sign_in', to: 'public/sessions#create'
  get 'customers/information/:id/edit', to: 'public/customers#edit', as: 'edit_public_customer_information'
  get '/customers/unsubscribe', to: 'public/customers#unsubscribe', as: 'public_customers_unsubscribe'
  patch '/customers/withdraw', to: 'public/customers#withdraw'

  get '/admin', to: 'admin/homes#top', as: 'admin_root'

  namespace :public, path: '' do
    resources :cards, except: [:destroy] do
      resource :favorite, only: [:create, :destroy]
      resources :card_comments, only: [:create, :update]
    end
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :rooms
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
  end

  namespace :admin do
    resources :cards, only: [:index, :show, :edit, :update] do
      resources :card_comments, only: [:create, :update]
    end
    resources :raritys, only: [:index, :create, :edit, :update, :show]
    resources :stores, only: [:index, :create, :edit, :update, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :rooms
    resources :sessions, only: [:new, :create]
    get 'homes/top', to: 'homes#top'
    get 'homes/home', to: 'homes#home'
  end
end
