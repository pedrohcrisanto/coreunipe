class AddOpmToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :opm, index: true, foreign_key: true
  end
end
