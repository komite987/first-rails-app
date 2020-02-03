Rails.application.routes.draw do
root 'welcome#home'

get 'about', to: 'welcome#about'


get 'pages/home', to: 'pages#home'

get 'pages/about', to: 'pages#about'
end
