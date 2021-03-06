  FramgiaTraining::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :examinations do
    resources :answer_sheets do
      resources :answer_sheet_details, only: [:show] do
      end
    end
  end
  resources :questions do
    resources :answers do
    end
  end
  resources :exam_questions do
    resources :exam_question_details do
    end
  end
  resources :question_groups
  resources :levels
  resources :subjects  do
    resources :subject_question_groups do
    end
  end
  resources :exam_sessions  do
    resources :exam_session_details do
    end
  end
  resources :exports
  resources :imports
  root  'static_pages#home'
  match 'examinations/:examination_id/answer_sheets/:answer_sheet_id/answer_sheet_details/:id/:attachment', to: 'answer_sheet_details#show', as: "download", via: 'get'
  match 'users/:id/:admin', to: 'users#update', as: "admin_user", via: 'patch'
  match '/admin',  to: 'admin#index',            via: 'get'
  match '/monitor',  to: 'monitor#index',            via: 'get'
  match '/generate',  to: 'monitor#generate',            via: 'get'
  match '/update_sequence',  to: 'monitor#update_sequence',            via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/home',    to: 'static_pages#home',    via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',    to: 'static_pages#about',    via: 'get'
  match '/contactus',    to: 'static_pages#contact',    via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
