Rails.application.routes.draw do
	resources :appointments do
	resources :comments
	
   end

  resources :comments

  resources :prescriptions

	controller :sessions do
		get 'login' => :new
		post 'login' => :create
		get 'logout' => :destroy
		delete 'logout' => :destroy
		get 'secondlogin' => :doctornew
		post 'secondlogin' => :doctorcreate
		get 'doctorlogout' => :doctordestroy
		delete 'doctorlogout' => :doctordestroy
		get 'nurselogin' => :nursenew
		post 'nurselogin' => :nursecreate
		get 'nurselogout' => :nursedestroy
		delete 'nurselogout' => :nursedestroy
		
	end
	
  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  get 'pages/home'

  get 'pages/about'
  
  get 'discount', :to => 'prescriptions#discount'
  
  get 'apply_discount', :to => 'prescriptions#apply_discount'
  
  get 'search', :to => 'doctors#search'
  
  get 'patientsearch', :to => 'patients#patientsearch'
  
  
  get 'regular' => 'patients#regular_patients'

  resources :nurses

  resources :doctors

  resources :appointments

  resources :patients

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'pages#home'

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
