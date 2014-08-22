Rails.application.routes.draw do 

    root  'static_pages#home'
    match '/home',    to: 'static_pages#home',    via: 'get'
    match '/help',    to: 'static_pages#help',    via: 'get'
    match '/about',   to: 'static_pages#about',   via: 'get'
    match '/contact', to: 'static_pages#contact', via: 'get'
    match '/signup',  to: 'users#new',            via: 'get'
    match '/signup/:id',  to: 'users#new',        via: 'get', as: 'profile1' 
 
    resources 'users' do
       resources 'tweets'  
    end

    
end
