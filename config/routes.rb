Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/surgeries', to: 'surgeries#index'
  get '/surgeries/:id', to: 'surgeries#show'
  get 'hospitals/:id/surgeries/', to: 'hospital/surgeries#index'
  post "/doctor_surgeries/:id", to: "doctor_surgeries#update"

end
