Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :sessions]
  as :user do
    get '/sign_in' => 'devise/sessions#new', :as => 'new_user_session'
    post '/sign_in' => 'devise/sessions#create', :as => 'user_session'
    get '/sign_out' => 'devise/sessions#destroy', :as => 'destroy_user_session'
    get '/users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put '/users(.:format)' => 'devise/registrations#update', as: 'user_registration'
    patch '/users(.:format)' => 'devise/registrations#update'
  end

  root "pages#home"
  get '/' => 'pages#home'
  get '/resume' => 'pages#resume'
  get '/portfolio' => 'projects#index'
  get '/interests' => 'pages#interests'
  get '/contact' => 'email_messages#new'
  post '/email_messages' => 'email_messages#create'
  
  resources :blog_posts
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
