Rails.application.routes.draw do
  root 'welcome#number_convert'


  resources :welcome,only:[] do
    collection do
      get :number_convert
      post :number_convert
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
