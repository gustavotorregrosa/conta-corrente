class MovimentacaoService

    def self.create_deposito(params, session)
        Movimentacao.create(valor: params[:valor], conta: session[:id], operacao: 'deposito')
        saldo = Saldo.find(session[:id])
        saldo.valor = saldo.valor + params[:valor].to_d
        saldo.save
    end

    def self.create_retirada(params, session)
        Movimentacao.create(valor: params[:valor], conta: session[:id], operacao: 'retirada')
        saldo = Saldo.find(session[:id])
        saldo.valor = saldo.valor - params[:valor].to_d
        saldo.save
    end

    def self.get_all(session)
        Movimentacao.where(conta: session[:id])
    end
end