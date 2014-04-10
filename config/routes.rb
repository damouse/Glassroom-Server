GlassroomProto::Application.routes.draw do
  resources :images

  get "images/edit"
  get "images/change_order"
  get "images/sort_order"
  get "images/update"
  get "images/delete"
  get "image/edit"
  get "image/change_order"
  get "image/sort_order"
  get "image/update"
  get "image/delete"
  devise_for :users

  root  'landing#home'

  resources :subjects do
    match '/lectures/:id', to: 'lectures#lecture_viewer', via: 'get', as: 'lecture'
  end

  match '/dashboard',   to: 'static#dashboard',   via: 'get'
  match '/bootstrapExamples',   to: 'static#bsexamples',   via: 'get'
  

  #get "static_pages/about"
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
