namespace :admin do 
  get 'dashboard' => "sites#dashboard"
  resources :users
end
