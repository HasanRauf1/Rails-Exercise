Rails.application.routes.draw do
  resources :articles, only: [:index, :create, :show] do
    member do
      put '/', to: 'articles#method_not_allowed'
      patch '/', to: 'articles#method_not_allowed'
      delete '/', to: 'articles#method_not_allowed'
    end
  end
end
