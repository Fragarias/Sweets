Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    get 'customers/quit'
    patch 'customers/update'
    patch 'customers/withdraw'
    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    post 'orders/confirm'
    get 'orders/complete'
    resources :orders, only: [:new, :create, :index, :show]
  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

end

