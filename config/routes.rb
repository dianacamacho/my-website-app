Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :sessions]
  
  as :user do
    get '/sign_in' => 'devise/sessions#new', :as => 'new_user_session'
    post '/sign_in' => 'devise/sessions#create', :as => 'user_session'
    get '/sign_out' => 'devise/sessions#destroy', :as => 'destroy_user_session'
    get '/users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put '/users(.:format)' => 'devise/registrations#update', :as => 'user_registration'
    patch '/users(.:format)' => 'devise/registrations#update'
  end

  root "email_messages#new"
  
  get '/about' => 'email_messages#new', as: :about
  get '/blog' => 'blog_posts#index', as: :blog
  get '/unpublished_posts' => 'blog_posts#unpublished_posts', as: :unpublished_posts
  resources :blog_posts
  resources :projects
  resources :email_messages, only: [:create]
end
