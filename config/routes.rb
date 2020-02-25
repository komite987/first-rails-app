Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
resources :articles

root 'welcome#home'

get 'about', to: 'welcome#about'

get 'signup', to: 'users#new'

resources :users, except: [:new]

get 'login', to: 'sessions#new'

post 'login', to: 'sessions#create'

delete 'logout', to: 'sessions#destroy'

end
