class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      # Colunas - PMPB
      t.string    :first_name, null: false, default: ''
      t.string    :last_name, null: false, default: ''
      t.integer   :rank
      t.boolean   :military, null: false, default: true
      t.boolean   :inactive, null: false, default: false
      t.integer   :pants_size
      t.integer   :beret_size
      t.integer   :t_shirt_size
      t.integer   :boot_size
      t.date      :birth_date, null: false
      t.date      :admission_date
      t.string    :registration, null: false
      t.string    :cpf, null: false
      t.string    :home_phone
      t.string    :mobile_phone, null: false
      t.string    :address
      t.string    :complement
      t.string    :neighborhood
      t.string    :city
      t.boolean   :active, default: true
      t.string    :state


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
