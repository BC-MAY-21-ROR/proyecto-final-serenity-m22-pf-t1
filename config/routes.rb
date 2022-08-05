Rails.application.routes.draw do
  root 'home#index'
  get 'customers/desactivate' => 'customers#desactivate'
  get 'stylists/desactivate' => 'stylists#desactivate'
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :invoices do
	  resources :order_items
	end

  post "reports/invoice_daily_report"=> "reports#invoice_daily_report"
    
	 
  resources :deductions
  resources :stylists
  resources :businesses
  resources :payments
  resources :subcategories
  resources :categories
  resources :products
  resources :customers
  resources :reports
  
  
end
