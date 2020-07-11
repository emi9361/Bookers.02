Rails.application.routes.draw do
   root 'homes#top'
   get 'home/about' => 'homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :books
   resources :users, only:[:index, :show, :edit, :update, :create]

end
