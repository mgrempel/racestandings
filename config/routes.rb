Rails.application.routes.draw do
  get "seasons/index"
  get "/seasons/:id", to: "seasons#show", as: "season"
  get "circuits/index"
  get "/circuits/:id", to: "circuits#show", as: "circuit"
  get "laptimes/index"
  get "/laptimes/:id", to: "laptimes#show", as: "laptime"
  get "drivers/index"
  get "/drivers/:id", to: "drivers#show", as: "driver"
  get "home/index"
  get "home/about"
  post "home/search", to: "home#search", as: "search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
