Rails.application.routes.draw do
  resources :messages, except: %i[update show]
  post 'authenticate', 'authentication#authenticate'
end
