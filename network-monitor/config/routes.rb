Rails.application.routes.draw do
  get 'packages/index'
  get 'packages/show'
  get 'packages/detailed_statistics'

  root to: 'application#index'
end
