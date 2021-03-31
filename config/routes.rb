Rails.application.routes.draw do
  root to: redirect('/todos')

  get 'todos', to: 'site#index'
  get 'todos/new', to: 'site#index'
  get 'todos/:id/edit', to: 'site#index'
  
  # react で http 通信を行うためのルーティング
  namespace :api do
    namespace :v1 do
      # resources にないアクションを使っているため別途で作成
      delete '/todos/destroy_all', to: 'todos#destroy_all'
      # edit, newアクションは定義していないためonlyで制約
      resources :todos, only: %i[index show create update destroy]
    end
  end
end
