Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get '/enquiries', to: 'enquiries#index'
    post '/enquiries', to: 'enquiries#create'
    get '/enquiries/:id', to: 'enquiries#show'
    put '/enquiries/:id', to: 'enquiries#update'
    delete '/enquiries/:id', to: 'enquiries#destroy'


    get '/cakes', to: 'cakes#index'
    get '/cakes/:id', to: 'cakes#show'
    post '/cakes', to: 'cakes#create'
    put '/cakes/:id', to: 'cakes#update'
    delete '/cakes/:id', to: 'cakes#destroy'

    get '/topics', to: 'topics#index'
    scope '/auth' do
      post '/sign_up', to: 'users#create'
      post '/sign_in', to: 'users#sign_in'
      put '/update/:id', to: 'users#update'
      delete '/delete/:id', to: 'users#destroy'
      get '/user/:id', to: 'users#show'
    end
  end
end
