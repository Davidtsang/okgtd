Okgtd::Application.routes.draw do

  resources :tags

  get "organzie/index"
  get "static_pages/home"
  get "process/:id/needdo"  => "process#needdo"
  get 'process/:id/doit' =>'process#doit'
  get 'process/:id/donot' =>'process#donot'
  get 'process/:id/donow' =>'process#donow'
  get 'process/:id/dolater' =>'process#dolater'
  get 'process/:id/done' =>'process#done'
  get 'process/:id/to_trash' =>'process#to_trash'
  get 'process/:id/to_ref' =>'process#to_ref'
  get 'process/:id/to_future' =>'process#to_future'
  get 'process/:id/to_org' =>'process#to_org'
  get 'process/:id/to_other' =>'process#to_other'

  get 'organzie/:id/org' =>'organzie#org'

  match '/next_action', to: 'stuffs#next_action' ,via:'get'
  match '/schedule', to: 'stuffs#schedule' ,via:'get'
  match '/project', to: 'stuffs#project' ,via:'get'
  match '/all', to: 'stuffs#index' ,via:'get'
  match '/next_action_by_tag/:id', to: 'stuffs#next_action_by_tag',via: 'get'
  match '/organzie/:id/org_act',to:'organzie#org_act',via: 'patch'
  match '/organzie/:id/set_schedule_act',to:'organzie#set_schedule_act',via: 'patch'
  match '/stuffs/:id/set_schedule_act',to:'stuffs#set_schedule_act',via: 'patch'
  match '/organzie', to: 'organzie#index', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'
  match '/signup',  to: 'users#new', via: 'get'
  match '/inbox',  to: 'stuffs#new', via: 'get'
  match '/process', to: 'process#index', via: 'get'

  get "static_pages/about"
  get "static_pages/contact"
  resources :users
  resources :stuffs
  resources :sessions , only: [:new, :create, :destroy]
  match '/signin' , to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
  root :to => "static_pages#home"
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
