class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name, null: false, default: ''

      t.timestamps null: false
    end
  end
end
