Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #----------game routes----------#
    get "/games" => "games#index"
    get "/games/:id" => "games#show"
    #----------user routes----------#
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"
    #----------session routes----------#
    post "/sessions" => "sessions#create"
    #----------user_games routes----------#
    get "/user_games/:id" => "user_games#show"
  end
end
