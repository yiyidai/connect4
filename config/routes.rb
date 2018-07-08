Rails.application.routes.draw do
  resources :nodes

  get 'connect4/home'
  post 'connect4/init'
  post 'nodes/click1'
  post 'nodes/click2'
  post 'nodes/click3'
  post 'nodes/click4'
  post 'nodes/click5'
  post 'nodes/click6'
  post 'nodes/click7'

end
