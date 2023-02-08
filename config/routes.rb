Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/articles/:category", to: "article#inde̊
  get "/articles", to: "article#index"
  get "/articles/paginate", to: "article#articles_pagination"
  post "/articles", to: "article#create"
  put "/articles/:id", to: "article#update"
  delete "/articles/:id", to: "article#delete"

  get "/users", to: "user#index"
  post "/users", to: "user#create"
  post "/users/check_password", to: "user#check_password"
  put "/users/update_password", to: "user#update_password"
  get "/users/paginate", to: "user#users_pagination"
end
