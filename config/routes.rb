Rails.application.routes.draw do
  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  # get '/admin/stats', to: 'stats#index'
  # 
  # turns into:
  # 
  # scope '/admin' do
  #   resources :stats, only: [:index]
  # end 
  # 
  # but this needs an associated module:
  # 
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end 
  # 
  # this can be shortened to:

  namespace :admin do
    resources :stats, only: [:index]
  end

  # !! However, the above code changes the route to "admin_stats_path" instead of "stats_path"

  root 'posts#index'
end
