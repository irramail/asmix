Rails.application.routes.draw do

  resources :periods
  resources :statuses
  resources :plists
  resources :suborders
  resources :orders
  devise_for :users
  resources :plsbgmusic_mediafiles
  resources :plsbgmusic_devices
  resources :plsbgimages
  resources :plsbgvideos
  resources :plsbgmusics
  #get 'gtws/index'

  post '/' => 'gtws#index'

  post "/tasks/create_setvol" => "tasks#create_setvol"
  post "/tasks/create_synctime" => "tasks#create_synctime"
  post "/tasks/create_setinterval" => "tasks#create_setinterval"
  post "/tasks/create_equalizer" => "tasks#create_setequalizer"
  post "/tasks/create_reboot" => "tasks#create_reboot"
  post "/tasks/create_getver" => "tasks#create_getver"
  post "/tasks/create_getinfo" => "tasks#create_getinfo"
  post "/tasks/create_ssh" => "tasks#create_ssh"
  post "/tasks/create_setvolsofday" => "tasks#create_setvolsofday"
  post "/tasks/create_worktime" => "tasks#create_worktime"
  post "/tasks/create_update" => "tasks#create_update"
  post "/tasks/create_delall" => "tasks#create_delall"

  post "/orders/start" => "orders#start"
  post "/orders/cancel" => "orders#cancel"

  resources :tasks
  resources :typeofstatuses
  resources :typeoftasks
  resources :devices do
    resources :volumes
  end

  resources :markets do
    resources :worktime_broadcastings
    resources :volsofdays
  end

  resources :contents do
    resources :mediafiles
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'gtws#index'

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
