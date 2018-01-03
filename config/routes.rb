Rails.application.routes.draw do
  resources :messages, except: %i[update show]
  post 'authenticate', to: 'authentication#authenticate'
end
