Rails.application.routes.draw do
  devise_for :admin,  controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
 root to: 'homes#top'
 resources :items, except: [:destroy]
 resources :genres, only: [:index, :create, :edit, :update]
 resources :customers, only: [:index, :show, :edit, :update]
 resources :orders, only: [:show, :update]
 resources :order_details, only: [:index, :update]
end

scope module: :public do
 root to: 'homes#top'
 get '/about' => 'homes#about', as: 'about'
 delete '/cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
 get '/orders/thanks' => 'orders#thanks', as: 'thanks'
 resources :items, only: [:index, :show]
 resources :cart_items, only: [:index, :create, :destroy, :update]
 resource :customers, only: [:index, :show, :edit, :update]
 get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
 patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
 resources :orders, only: [:new, :show, :create, :index]
 resources :addresses, except: [:show]
 post '/orders/confirm' => 'orders#confirm', as: 'confirm'
end
 
 devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
} 
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
