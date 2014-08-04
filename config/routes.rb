Rails.application.routes.draw do

  resource :user, only: [:create, :new, :show] do
    resources :circles
    resources :posts
  end

  resource :session, only: [:create, :new, :destroy]

end
