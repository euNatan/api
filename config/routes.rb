Rails.application.routes.draw do
  devise_for :contacts
    devise_for :users
    namespace :api do
      namespace :v1 do
        resources :contacts
        resources :items
        resources :categories
        resources :statuses
        devise_scope :contact do
          post   '/sign_in'  => 'sessions#create'
          delete '/sign_out' => 'sessions#destroy'
        end
      end
    end
end
