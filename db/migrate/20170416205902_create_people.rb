class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :full_name
      t.date :birth_date
      t.string :cpf
      t.string :home_phone
      t.string :mobile_phone
      t.string :rg
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
