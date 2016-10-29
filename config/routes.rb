Rails.application.routes.draw do
  get 'laboratories/index'

  resources :laboratories, only: [:new, :create, :index, :show], path: '' do
    resources :experiments, only: [:index]
    resources :assumptions, only: [:index]
    resources :results, only: [:index]
    resources :actions, only: [:index]
  end

  resources :experiments, except: [:index, :destroy] do
    resource :assumption, only: [:new]
    resource :result, only: [:new]
    resource :action, only: [:new]
  end

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
