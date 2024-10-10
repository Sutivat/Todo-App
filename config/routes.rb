Rails.application.routes.draw do
  resources :tasks, only: [:index, :create]
  patch 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
end
