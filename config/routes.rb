Zambia::Application.routes.draw do
  resources :checkins

  resources :inquiries, :defaults => { :format => 'json' }
  resources :locations, :defaults => { :format => 'json' }

  root :to => 'site#index'

  match '*path', :to => 'backbone#hashify_path'
end
