Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about', as: 'about'

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客側
  post '/customers/sign_in', to: 'public/sessions#create'
  get 'customers/my_page', to: 'public/customers#show', as: 'public_customers'
  get 'customers/information/edit', to: 'public/customers#edit', as: 'public_customers_information_edit'
  # 退会処理
  get '/customers/unsubscribe', to: 'public/customers#unsubscribe', as: 'public_customers_unsubscribe'
  patch '/customers/withdraw', to: 'public/customers#withdraw'

  # 管理者側
  get '/admin', to: 'admin/homes#top', as: 'admin_root'

  namespace :public, path: '' do
    resources :cards, except: [:destroy]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :rooms
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
  end

  namespace :admin do
    resources :cards, only: [:index, :show, :edit, :update]
    resources :raritys, only: [:index, :create, :edit, :update, :show]
    resources :stores, only: [:index, :create, :edit, :update, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :rooms
    resources :homes, only: [:top]
    resources :sessions, only: [:new, :create]
  end

end
