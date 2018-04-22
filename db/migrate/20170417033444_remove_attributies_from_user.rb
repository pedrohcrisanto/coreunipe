class RemoveAttributiesFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :rank, :integer
    remove_column :users, :registration, :string
    remove_column :users, :admission_date, :date
    remove_column :users, :t_shirt_size, :integer
    remove_column :users, :boot_size, :integer
    remove_column :users, :beret_size, :integer
    remove_column :users, :pants_size, :integer
    remove_column :users, :cpf, :string
    remove_column :users, :birth_date, :date
    remove_column :users, :home_phone, :string
    remove_column :users, :mobile_phone, :string
    remove_column :users, :address, :string
    remove_column :users, :complement, :string
    remove_column :users, :neighborhood, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
  end
end
