class ContasController < ApplicationController
    before_action :conta_params, only: [ :salvar ]
    before_action :authorize, :only => [:exibe_saldo]
    
    def apresentacao
        render :inicial
    end

    def exibe_saldo
        @conta = Conta.includes(:saldo).find(session[:id])
        render :saldo
    end

    def nova
        render :nova
    end

    def login
        render :login
    end

    def salvar
        conta = ContaService.create(conta_params)
        session[:conta] = conta_params[:nome]
        session[:id] = conta
        redirect_to '/conta/saldo'
    end

    private

    def conta_params
        params.permit(:nome, :email, :password)
    end
end
