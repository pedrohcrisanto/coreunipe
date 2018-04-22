class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :district
      t.string :number
      t.string :zip
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
