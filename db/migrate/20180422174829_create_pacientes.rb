class CreatePacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :cep
      t.string :complemento
      t.string :telefone
      t.string :email
      t.date :data_nasc
      t.string :sexo
      t.string :escolaridade
      t.string :naturalidade
      t.string :estado_civil
      t.boolean :filhos
      t.integer :qnt_filhos
      t.string :profissao
      t.string :religiao
      t.boolean :pm
      t.integer :matricula
      t.integer :rg
      t.string :graduacao
      t.string :unidade
      t.string :subunidade

      t.timestamps
    end
  end
end
