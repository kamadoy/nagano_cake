Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 root to: 'public/homes#top'

  scope module: :public do
    resources :items,only: [:index,:show]
    resources :cart_items,only: [:index,:create,:update,:destroy]
    resources :adresses,only: [:index,:edit,:create,:destroy,:update]
    get 'homes/about' => 'homes#about', as: 'about'
  end
  namespace :public do
    #get 'homes/top'


   # get 'homes/about' => 'homes#about', as: 'about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
