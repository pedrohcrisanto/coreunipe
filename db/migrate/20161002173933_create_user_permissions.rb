class CreateUserPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_permissions do |t|

      t.references  :user, index: true, foreign_key: true
      t.references  :permission, index: true, foreign_key: true
      t.string      :category, null: false, default: 'funcional'

      # funcional = Permissão Funcional
      # adicional = Permissão Adicional
      # generico = Permissão Genérica


    end
  end
end
