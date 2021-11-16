Rails.application.routes.draw do

  get "/conta/nova", to: "contas#nova"
  get "/conta/logout", to: "login#logout"
  get "/conta/saldo", to: "contas#exibe_saldo"
  get "/conta/login", to: "contas#login"
  post "/conta/login", to: "login#attemp_login"
  post "conta/salvar", to: "contas#salvar"

  get "/movimentacoes/deposito", to: "movimentacoes#deposito"
  post "/movimentacoes/deposito", to:"movimentacoes#fazer_deposito"

  get "/movimentacoes/retirada", to: "movimentacoes#retirada"
  post "/movimentacoes/retirada", to:"movimentacoes#fazer_retirada"

  get "/movimentacoes/extrato", to: "movimentacoes#extrato"


  get "/", to: "contas#apresentacao"
  
end
