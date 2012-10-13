Capo::Application.routes.draw do

  resources :capfiles

  root to: 'capfiles#new'

end
