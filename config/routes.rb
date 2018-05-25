Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts,:pictures, :profiles do
  	resources :posts,:pages
  end
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'profiles/:profile_id/tags/:tag', to: 'posts#index'
  get 'profiles/:profile_id/categories/:cate_id', to: 'posts#index'
  get 'profiles/:search_keyword', to: 'profiles#index'
  #root "posts#index"
  root to: "posts#index"

  if Rails.env.production?
    mount Shrine.presign_endpoint(:cache) => "/presign"
  else
    # In development and test environment we're using filesystem storage
    # for speed, so on the client side we'll upload files to our app.
    mount Shrine.upload_endpoint(:cache) => "/upload"
  end

end
