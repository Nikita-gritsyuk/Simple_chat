Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'chat#index'
  get 'add' => 'chat#add_message'
  get 'messages' => 'chat#messages'
  get 'online' => 'chat#online'
  post 'messages' => 'chat#send_message'
end
