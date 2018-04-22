class Person < ApplicationRecord
  # attr_accessor :full_name, :birth_date, :cpf, :home_phone, :home_phone, :rg
  belongs_to :address
  accepts_nested_attributes_for :address

  has_one :user
end
