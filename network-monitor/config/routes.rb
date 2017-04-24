Rails.application.routes.draw do
  get 'packages/index'
  get 'packages/show'

  root to: 'application#index'
end
