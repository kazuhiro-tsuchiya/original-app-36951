Rails.application.routes.draw do
  get 'teams/index'
  root to: "teams#index"
end
