class Address < ApplicationRecord
  # attr_accessor :street, :district, :number, :zip, :city, :state
  has_many :people
end
