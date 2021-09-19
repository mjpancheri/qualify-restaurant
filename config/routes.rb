Rails.application.routes.draw do
  resources :comentarios
  resources :clientes
  resources :restaurantes
  resources :qualificacoes
  
  root 'welcome#index'
end
