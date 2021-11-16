require 'bcrypt'

class ContaService

    def self.create(params)
        conta = Conta.new(params)
        conta.password = BCrypt::Password.create(params[:password])
        conta.save
        saldo = Saldo.create(id: conta.id, valor: '0')
        conta.id
    end
end