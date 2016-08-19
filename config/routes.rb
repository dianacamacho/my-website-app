Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get '/' => 'pages#home'
  get '/resume' => 'pages#resume'
  get '/portfolio' => 'pages#portfolio'
  get '/blog' => 'pages#blog'
  get '/interests' => 'pages#interests'
  get '/contact' => 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
