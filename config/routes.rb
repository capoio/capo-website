Capo::Application.routes.draw do

  resources :capfiles

  get '/about' => 'pages#about'

  root to: 'capfiles#new'

end
