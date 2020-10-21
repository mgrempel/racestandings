Rails.application.routes.draw do
  get "seasons/index"
  get "/seasons/:id", to: "seasons#show", as: "season"
  get "circuits/index"
  get "/circuits/:id", to: "circuits#show", as: "circuit"
  get "laptimes/index"
  get "drivers/index"
  get "home/index"
  get "home/about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
