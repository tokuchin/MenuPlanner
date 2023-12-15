Rails.application.routes.draw do
  get 'menus/new'
  get 'recipes/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :recipes
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  # menu_path(memnus#show)をgetするには:idが必要となるが、同日のmenu.recipesを「全て」表示したいため、都合が悪い。
  # :collectionを使用すると、:idが不要になる。
  # show_menus_menus_pathのroutingが生成される
  resources :menus do
    collection do
      get 'show_menus'
    end
  end
end
