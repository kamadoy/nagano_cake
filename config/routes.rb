Rails.application.routes.draw do

  devise_for :admins, skip: [:passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 root to: 'public/homes#top'

  scope module: :public do

    get '/about' => 'homes#about', as: 'about'
    get 'customers/unsubsrib'=> 'customers#unsubsrib', as: 'unsubsrib'
    patch 'customers/withdraw'=> 'customers#withdraw', as: 'withdraw'
    delete '/cart_items/:id/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items,only: [:index,:create,:update,:destroy]
    resources :adresses,only: [:index,:edit,:create,:destroy,:update]
    resources :customers,only: [:show,:edit,:update]
    resources :items,only: [:index,:show]
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    resources :orders,only: [:new,:create,:index,:show]




  end
  namespace :admin do
   resources :items,only: [:new,:create,:index,:show,:edit,:update]
   resources :genres,only: [:create,:index,:edit,:update]
   resources :customers,only: [:show,:index,:edit,:update]
   resources :order_details,only: [:show,:update]
   get '/'=> 'homes#top', as: 'top'
    #get 'homes/top'


   # get 'homes/about' => 'homes#about', as: 'about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
