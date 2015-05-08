Rails.application.routes.draw do
  devise_for :admins
  root 'panel#index'

  resources :panel, only: [:index]
  resources :groups, except: [:show]
  resources :tools, except: [:show]
  resources :users, except: [:show]
  post 'add_user_group' => 'users#add_user_group', as: 'add_user_group'

  post 'change_tools_admin' => 'tools#change_tools_admin', as: 'change_tools_admin'
  post 'taken_tools' => 'tools#taken_tools', as: 'taken_tools'
  get 'history' => 'panel#history', as: 'history'


end
