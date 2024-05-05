Rails.application.routes.draw do
  root "tasks#index"
  
  resources :tasks

  post "task/:id/toggle", to: "task#toggle"

end
