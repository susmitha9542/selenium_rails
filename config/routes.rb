
Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new", via: 'get'
    match '/logout', to: "devise/sessions#destroy", via: 'get'
  end
  resources :test_suites

  resources :results_dictionaries

  resources :result_cases

  resources :result_suites

  resources :environments

  resources :test_cases

  
  match '/home', to: "welcome#home", via: ["get", "post"]
  
  match "environments(/:id)/test_suites", to: "environments#test_suites", via: "get"

  match "/list_all_reports", to: "environments#list_all_reports", via: "get"

  match "/reports", to: "environments#reports", via: "get"

  match "run_suites", to: "environments#run_suites", via: "get"
  
  match "run_suites", to: "environments#run_suites", via: "post"
  
  match 'test_suites(/:id)/test_cases', to: "test_suites#test_cases", via: "get"

  match 'test_suites(/:id)/test_cases', to: "test_suites#test_cases", via: "get"

  match 'test_suites(/:id)/tests_ran', to: "test_suites#tests_ran", via: "get"
  
  match '/modal_show', to: "test_cases#modal_show", via: "get"
  
  match "import_suite", to: "test_suites#import_suite", via: "get"

  match "images", to: "environments#images", via: "get"
  
  post "import" => "test_suites#import"

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

