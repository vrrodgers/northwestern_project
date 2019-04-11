Rails.application.routes.draw do
  root to: 'registries#index'  
  resources :coordinator_registries
  resources :participants, except: [:show]
  resources :coordinators, except: [:show]
  resources :registries do
    get :toggle_status
    resources :enrollments
    resources :coordinator_registries, except: [:show, :index] 
  end

end
