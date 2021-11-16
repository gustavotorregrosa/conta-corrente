class MovimentacoesController < ApplicationController
    before_action :authorize
    before_action :movimentacao_params, only: [ :fazer_deposito ]

    def exibe_deposito
        render :deposito
    end

    def exibe_retirada
        render :retirada
    end
    

    def fazer_deposito
        MovimentacaoService.create_deposito(params, session)
        flash[:message] = "Depósito feito" 
        redirect_to "/"
    end

    def fazer_retirada
        MovimentacaoService.create_retirada(params, session)
        flash[:message] = "Retirada feita" 
        redirect_to "/"
    end

    def extrato
        @itens = MovimentacaoService.get_all(session)
        render :extrato
    end

    private

    def movimentacao_params
        params.permit(:valor)
    end

end