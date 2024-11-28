Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :user do
  root to: 'homes#top'
  get '/items', to: 'homes#menu', as: 'menu'
  get '/openinghour', to: 'homes#opening', as: 'opening'
  get '/access', to: 'homes#access', as: 'access'
  get '/contact', to: 'homes#contact', as: 'contact'
end

namespace :admin do
  root to: 'homes#top'
  resources :items, except: [:show]
  resources :notices, except: [:show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
