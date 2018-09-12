Rails.application.routes.draw do
  root "welcome#index"

  get :word_search, to: 'word_search#index'

  namespace :api do
    namespace :v1 do
      get 'games/:id', to: 'games#show'
      namespace :games do
        post '/:id/plays', to: 'plays#create'
      end
    end
  end
end
