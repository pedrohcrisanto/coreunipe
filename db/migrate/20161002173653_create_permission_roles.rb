class CreatePermissionRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :permission_roles do |t|

      t.references  :permission, index: true, foreign_key: true
      t.references  :role, index: true, foreign_key: true

    end
  end
end
