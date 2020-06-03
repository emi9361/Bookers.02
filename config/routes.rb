Rails.application.routes.draw do
   root 'homes#top'
   get 'home/about' => 'homes#about'
   devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :books, only:[:create, :index, :show, :edit, :update, :destroy]
   resources :users, only:[:index, :show, :edit, :update, :create]

end
