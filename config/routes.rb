# frozen_string_literal: true

Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
