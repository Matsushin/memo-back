Rails.application.routes.draw do
  get '/health_check', to: "health_check#index"

  namespace :api do
    namespace :v1 do
      resources :memos
    end
  end
end
