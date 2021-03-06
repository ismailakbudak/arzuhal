Rails.application.routes.draw do 
 
   devise_for :users, controllers: { registrations: 'registrations' }

    root  'static_pages#home'
    match '/home',    to: 'static_pages#home',    via: 'get'
    match '/help',    to: 'static_pages#help',    via: 'get'
    match '/about',   to: 'static_pages#about',   via: 'get'
    match '/contact', to: 'static_pages#contact', via: 'get' 
 
    resources 'users' do
       resources 'tweets'  
    end

    
end
