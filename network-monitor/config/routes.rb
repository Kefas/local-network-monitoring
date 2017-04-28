Rails.application.routes.draw do
  get 'packages/index'
  get 'packages/show'
  get 'packages/daily_activity'
  get 'packages/test'
  post 'packages/daily_activity' => 'packages#daily_activity'

  root to: 'application#index'
end
