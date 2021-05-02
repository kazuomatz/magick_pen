Rails.application.routes.draw do

  namespace :magick_pen do
    post 'snippet', to: 'snippets#update'
    get 'snippet/version', to: 'snippets#version'
  end

end
