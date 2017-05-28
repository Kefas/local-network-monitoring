Rails.application.routes.draw do
  get 'packages/index'
  get 'packages/show'
  get 'packages/daily_activity'
  get 'packages/name_activity'
  get 'packages/test'
  get 'packages/doughnut'
  post 'packages/daily_activity' => 'packages#daily_activity'
  post 'packages/name_activity' => 'packages#name_activity'

  root to: 'application#index'
end
