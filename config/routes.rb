Rails.application.routes.draw do
  resources :clientes
  resources :restaurantes
  resources :qualificacoes
  
  root 'welcome#index'
end
