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
  
    resources :cart_items,only: [:index,:create,:update,:destroy]
    resources :adresses,only: [:index,:edit,:create,:destroy,:update]
    get '/about' => 'homes#about', as: 'about'
  end
  namespace :admin do
   resources :items,only: [:new,:create,:index,:show,:edit,:update]
   resources :genres,only: [:create,:index,:edit,:update]
    #get 'homes/top'


   # get 'homes/about' => 'homes#about', as: 'about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
