Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, :profiles do
  	resources :posts,:pages
  end
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'profiles/:profile_id/tags/:tag', to: 'posts#index'
  get 'profiles/:profile_id/categories/:cate_id', to: 'posts#index'
  #root "posts#index"
  root to: "posts#index"
end
