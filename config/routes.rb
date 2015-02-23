Tweetspeak::Application.routes.draw do
  resources :courses

  devise_for :users
  resources :users, only: [:index]
  get "static_pages/home"
  resources :lessons do
    resources :tracks
  end
  resources :charges

  get "/lessons/:id/step/:step_number" => "lessons#step"
  get "pages/about"
  get "pages/contact"
  get "dictionary" => "pages#dictionary", as: :pages_dictionary
  get "subscription" => "pages#subscription", as: :pages_subscription
  get "dashboard" => "pages#dashboard", as: :pages_dashboard

  # Error pages
  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  root 'static_pages#home'

  resources :charges do
    post :cancel, :on => :collection
end
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

  resources :videos do
    member do
      get :show_video
    end
  end

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
