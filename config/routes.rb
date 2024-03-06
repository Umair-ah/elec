Rails.application.routes.draw do
  namespace :admin do
    resources :bills
  end
  devise_for :admins, skip: [:registrations]
  devise_for :users

  authenticated :admin do
    root to: "admin/bills#index", as: :admin_root
  end


  post 'bill_pay/:id', to:"homes#pay", as: :pay_bill 

  

  root "homes#index"
end
