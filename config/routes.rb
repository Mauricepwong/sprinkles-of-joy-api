Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get '/enquiries', to: 'enquiries#index'
    post '/enquiries', to: 'enquiries#create'
    get '/enquiries/test', to: 'enquiries#test'
    get '/enquiries/:id', to: 'enquiries#show'
    put '/enquiries/:id', to: 'enquiries#update'
    delete '/enquiries/:id', to: 'enquiries#destroy'


    get '/cakes', to: 'cakes#index'
    get '/cakes/:id', to: 'cakes#show'
    get '/topics', to: 'topics#index'
    scope '/auth' do
      post '/sign_up', to: 'users#create'
      post '/sign_in', to: 'users#sign_in'
      put '/update/:id', to: 'user#update'
      delete '/delete/:id', to: 'user#destroy'
      get '/users', to: 'users#index'
    end
  end
end
