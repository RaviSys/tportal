namespace :admin do 
  get 'dashboard' => "sites#dashboard"
  resources :users
  resources :mentor_groups do 
    collection do 
      post :assign_mentors_to_group
    end
  end
  resources :programs
end
