Rails.application.routes.draw do
  root 'users#index'

  get '/home' => 'users#main'

  get 'users/view'

  get 'users/edit'

  get 'users/delete'

  get 'users/leave'

  get 'users/join'

  get '/logout' => 'users#logout'

  get "/view/:id" => 'users#view'

  patch '/leave/:id' => 'users#leave'

  patch '/delete/:id' => 'users#delete'

  post '/process/create' => 'users#create'
  
  post '/process/login' => 'users#login'

  patch '/join/:id' => 'users#join'

  post '/create/:id' => 'users#new'

  # patch '/delete/:id/view' => 'users#view2'
  
  # patch '/leave/:id/view' => 'users#view2'
  
  # patch '/join/:id/view' => 'users#view2'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
