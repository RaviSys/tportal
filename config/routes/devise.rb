devise_for :users, controllers: {
  sessions: 'users/sessions', 
  registrations: 'users/registrations',
  passwords: 'users/passwords',
  confirmations: 'users/confirmations',
  unlocks: 'users/unlocks'
}
