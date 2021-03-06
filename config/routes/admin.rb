namespace :admin do 
  get 'dashboard' => "sites#dashboard"
  resources :users
  resources :mentor_groups do 
    collection do 
      post :assign_mentors_to_group
    end
  end
  resources :programs do 
    collection do 
      get :settings
    end
    member do 
      get  :check_if_assigned_to_tutors
      get  :check_if_assigned_to_participants
      get  :add_lectures
      post :create_lectures
    end
    resources :lectures, shallow: true
  end

  resources :participant_programs do 
    collection do 
      get   :assign_participants, path: 'assign'
      post  :create_multiple_pp
    end
  end 

  resources :tutor_programs do 
    collection do 
      get   :assign_tutors, path: 'assign'
      post  :create_multiple_tp
    end
  end 

end
