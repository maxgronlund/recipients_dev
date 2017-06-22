Rails.application.routes.draw do
  resources :users
  resources :organizations do
    resources :families
    resources :message_subjects
    resources :family_append_to_mails
  end

  root 'organizations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
