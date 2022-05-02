Rails.application.routes.draw do
  devise_for :admin,  controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :admin do
 root to: 'homes#top'
 resources :items, except: [:destroy]
 resources :genres, only: [:index, :create, :edit, :update]
 resources :customers, only: [:index, :show, :edit, :update]
 resources :orders, only: [:show, :update]
 resources :orders_details, only: [:index, :update]
end

scope module: :public do
 root to: 'homes#top'
 get '/about' => 'homes#about', as: 'about'
 resources :items, only: [:index, :show]
 resources :cart_items, only: [:index, :create, :destroy, :update]
 resources :customers, only: [:index, :show, :edit, :update]
 get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
 patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
 resources :orders, only: [:new, :show, :create, :index]
 resources :addresses, except: [:show]
 get '/orders/confirm' => 'orders#confirm', as: 'confirm'
 get '/orders/thanks' => 'orders#thanks', as: 'thanks'
end
 
 
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
