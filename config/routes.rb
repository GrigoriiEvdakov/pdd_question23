Rails.application.routes.draw do
  post '/check_answers', to: 'questions#check_answers'
  get '/result', to: 'questions#result'
  get '/new', to: 'questions#new'
  resources :questions
  resources :answers
end
