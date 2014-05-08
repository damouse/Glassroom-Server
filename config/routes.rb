GlassroomProto::Application.routes.draw do

  get "mobile_api/auth"

  get "notes/create"

  get "images/change_order"
  get "images/edit"
  
  get "images/sort_order"
  get "images/update"
  get "images/delete/:id", to: "images#delete", as: "images_delete"
  get "images/check_incoming"

  #new notes routes
  match 'notes/change_order', to: 'notes#change_order', via: 'post'
  match 'notes/update', to: 'notes#update', via: 'post'
  get 'notes/delete'


  devise_for :users

  #consolidate these - Mickey
  match '/api/auth', to: 'mobile_api#auth', via: 'post'
  match '/api/login', to: 'mobile_api#mobile_login', via: 'get'
  match '/api/upload_image', to: 'mobile_api#upload_image', via: 'post'
  match '/api/create_lecture', to: 'mobile_api#create_lecture', via: 'post'

  root  'landing#home'

  resources :subjects do
    #match '/lectures/:id', to: 'lectures#lecture_viewer', via: 'get', as: 'lecture'
    match '/lectures_two/:id', to: 'lectures#lecture_viewer_two', via: 'get', as: 'lecture'
  end

  match '/dashboard',   to: 'static#dashboard',   via: 'get'
  match '/account',   to: 'static#account',   via: 'get'
  match '/bootstrapExamples',   to: 'static#bsexamples',   via: 'get'

end
