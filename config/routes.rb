ConferenceEducation::Application.routes.draw do
  match "tagged/:tag_permalink", :as => "tagged", :to => "tagged#show"

  devise_for :users, :controllers => { :registrations => "users/registrations" } do
    get  "login",  :to => "devise/sessions#new"
    post "login",  :to => "devise/sessions#create"
    get  "logout", :to => "devise/sessions#destroy"
  end
  
  resources :presentations, :only => [:index]
  resources :speakers, :only => [:index, :show]
  resources :events, :only => [:show] do
    resources :presentations, :only => [:show]
  end

  namespace :admin do
    resources :presentations
    resources :speakers
    resources :events
    match 'speaker_rate/:action/:id' => 'speaker_rate', :as => 'speaker_rate_speaker'
  end

  match 'admin' => 'admin#index'

  match 'search' => 'search#search'

  root :to => "presentations#index"
end
