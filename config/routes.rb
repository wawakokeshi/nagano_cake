Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
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
 resources :orders_details, only: [:update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
