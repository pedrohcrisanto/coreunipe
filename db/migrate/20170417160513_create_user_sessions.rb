class CreateUserSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_sessions do |t|
      t.references :user, foreign_key: true
      t.string :token, null: false, default: ''
      t.datetime :expire_date

      t.timestamps
    end
  end
end
