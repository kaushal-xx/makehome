Rails.application.routes.draw do

  root 'rails_admin/main#dashboard'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }
    devise_for :services, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }
    devise_for :builders, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }
    resources :users
    resources :services do 
      collection do
        get :service_type_list
      end
      member do 
        post :upload_images
      end
    end
    resources :builders
  	resources :job_applications
  	resources :jobs
  	resources :profiles
  	resources :projects
    resources :images
    resources :sliders
    resources :enquiries
    resources :call_histories
    resources :feedbacks
  end
  devise_for :admins, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  scope :admin  do 
  	resource :user, only: [:show, :update, :edit, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
