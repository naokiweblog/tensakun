Rails.application.routes.draw do
  devise_for :students, controllers: {
    sessions:      'students/sessions',
    passwords:     'students/passwords',
    registrations: 'students/registrations'
  }
  devise_for :teachers, controllers: {
    sessions:      'teachers/sessions',
    passwords:     'teachers/passwords',
    registrations: 'teachers/registrations'
  }

  devise_scope :teacher do
    post 'teachers/guest_sign_in', to: 'teachers/sessions#new_guest'
  end
  devise_scope :student do
    post 'students/guest_sign_in', to: 'students/sessions#new_guest'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :student do
    root 'rooms#index', as: :student_authenticated_root
  end
  authenticated :teacher do
    root 'rooms#index', as: :teacher_authenticated_root
  end

  root 'tops#index'
  resources :rooms, only: [:index, :new, :create]

  resources :rooms do
    resources :answers, only: [:index, :create, :edit, :update]

    namespace :api do
      resources :answers, only: :index, defaults: { format: 'json' }
    end
  end
end
