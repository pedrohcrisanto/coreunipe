class CreateMilitaries < ActiveRecord::Migration[5.0]
  def change
    create_table :militaries do |t|
      t.string :name
      t.integer :rank
      t.string :registration
      t.date :admission_date
      t.integer :t_shirt_size
      t.integer :boot_size
      t.integer :beret_size
      t.integer :pants_size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
