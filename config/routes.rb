Rails.application.routes.draw do
  resources :coordinator_registries
  resources :participants
  resources :coordinators
  resources :registries do
    get :toggle_status
    resources :enrollments
    resources :coordinator_registries, except: [:show, :index] 
  end

end
