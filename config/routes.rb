ConferenceEducation::Application.routes.draw do
  match "tagged/:tag_permalink", :as => "tagged", :to => "tagged#show"

  devise_for :users do
    get  "login",  :to => "devise/sessions#new"
    post "login",  :to => "devise/sessions#create"
    get  "logout", :to => "devise/sessions#destroy"
  end
  
  post "events/:event_id/presentations/:presentation_id/watch-later", :to => "saved_presentations#create", :as => "save_presentation"

  resources :presentations, :only => [:index]
  resources :speakers, :only => [:index, :show]
  resources :events, :only => [:index, :show] do
    resources :presentations, :only => [:show]
  end

  # block out users routes we don't want/need for users
  #resources :users do
    #resources :presentations, :controller => 'saved_presentations', :as => 'saved_presentations'
  #end
  post 'users/:user_id/presentations/:id' => 'saved_presentations#create', :as => 'save_presentation'

  namespace :admin do
    resources :presentations, :only => [:index, :new, :create]
    resources :speakers
    resources :events do 
      resources :presentations, :except => [:index, :new, :create]
    end
    match 'speaker_rate/:action/:id' => 'speaker_rate', :as => 'speaker_rate_speaker'
  end

  match 'admin' => 'admin#index'

  match 'search' => 'search#search'

  match 'sitemap.:format' => 'sitemap#show', 
    :conditions => { :method => :get },
    :defaults   => { :format => :xml }

  root :to => "presentations#index"
end
