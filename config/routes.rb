Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/home', to: 'public/homes#home', as: 'home'
  get '/about', to: 'public/homes#about', as: 'about'

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :customer do
    post "customers/guest_sign_in", to: "customers/sessions#guest_sign_in"
    get '/customers', to: 'public/registrations#new'
  end

  post '/customers/sign_in', to: 'public/sessions#create'
  get 'customers/information/:id/edit', to: 'public/customers#edit', as: 'edit_public_customer_information'
  get '/customers/unsubscribe', to: 'public/customers#unsubscribe', as: 'public_customers_unsubscribe'
  patch '/customers/withdraw', to: 'public/customers#withdraw'
  get 'talk_rooms/:id', to: 'public/talk_rooms#show', as: 'talk_rooms'
  get 'talk_rooms/:against_customer_id/new', to: 'public/talk_rooms#new', as: 'new_talk_rooms'
  get '/admin', to: 'admin/homes#top', as: 'admin_root'

  namespace :public, path: '' do
    resources :cards, except: [:destroy] do
      resource :favorite, only: [:create, :destroy]
      resources :card_comments, only: [:create, :update]
      collection do
        get 'search'
      end
    end
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw] do
      member do
        get :favorites
      end
    end
    resources :talk_rooms, only: [:index,:create] do
      resources :talk_room_messages, only: [:create, :update]
    end
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
    resources :contacts, only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
        post 'back'
        get 'confirm_send'
      end
    end
  end

  namespace :admin do
    resources :cards, only: [:index, :show, :edit, :update] do
      resources :card_comments, only: [:create, :update]
      collection do
        get 'search'
      end
    end
    resources :raritys, only: [:index, :create, :edit, :update, :show]
    resources :stores, only: [:index, :create, :edit, :update, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :talk_rooms, only: [:index,:create, :show] do
      resources :talk_room_messages, only: [:update]
    end
    resources :sessions, only: [:new, :create]
    get 'homes/top', to: 'homes#top'
    get 'homes/home', to: 'homes#home'
    resources :contacts, only: [:index, :show, :edit, :update]
  end
end