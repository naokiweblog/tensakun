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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :sutdent do
    root 'rooms#index', as: :student_authenticated_root
  end
  authenticated :teacher do
    root 'rooms#index', as: :teacher_authenticated_root
  end

  root 'tops#index'
  resources :rooms, only: [:new, :create]
end
