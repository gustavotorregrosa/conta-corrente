class CreateContas < ActiveRecord::Migration[6.1]
  def change
    create_table :contas do |t|
      t.string :nome
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
