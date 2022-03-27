Rails.application.routes.draw do
  devise_for :admin,  controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#root to: 'public/homes#top'

namespace :admin do
 root to: 'homes#top'
 resources :items, except: [:destroy]
 resources :genres, only: [:index, :create, :edit, :update]
 resources :customers, only: [:index, :show, :edit, :update]
 resources :orders, only: [:show, :update]
 resources :orders_details, only: [:update]
end

scope module: :public do
 root to: 'homes#top'
 get '/about' => 'homes#about', as: 'about'
 resources :items, only: [:index, :show]
 resources :cart_items, only: [:index, :create, :destroy, :update]
 resources :customers, only: [:index, :show, :edit, :update]
 get '/customers/current_customer/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
 resources :orders, only: [:new, :show, :create, :index]
 resources :addresses, except: [:show]
end
 
 
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
