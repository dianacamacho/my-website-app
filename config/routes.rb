Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put '/users(.:format)' => 'devise/registrations#update', as: 'user_registration'
    patch '/users(.:format)' => 'devise/registrations#update'
  end

  root "pages#home"
  get '/' => 'pages#home'
  get '/resume' => 'pages#resume'
  get '/portfolio' => 'pages#portfolio'
  get '/blog' => 'pages#blog'
  get '/interests' => 'pages#interests'
  get '/contact' => 'pages#contact'

  resources :blog_posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
