class Role < ApplicationRecord

  has_many :user_roles
  has_many :users, through: :user_roles
  
  has_many :permissions_roles
  has_many :permissions, through: :permissions_roles

end
