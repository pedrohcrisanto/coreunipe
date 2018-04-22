class CreateTriagems < ActiveRecord::Migration[5.1]
  def change
    create_table :triagems do |t|
      t.string :nome_paciente
      t.text :desc_hist_tratamento
      t.text :desc_hist_medic
      t.boolean :psicoterapia
      t.text :queixa
      t.string :estado_paciente

      t.timestamps
    end
  end
end
