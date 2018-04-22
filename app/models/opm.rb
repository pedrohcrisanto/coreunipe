class Opm < ApplicationRecord

  belongs_to  :opm, foreign_key: 'parent_id', optional: true
  has_many    :subopms, class_name: 'Opm', foreign_key: 'parent_id'
  has_many    :placements
  has_many    :users

  validates :name, :address, :zip_code, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{address} #{zip_code}"
  end

  def self.top_opms
    Opm.where(opm: nil)
  end

  def self.opm_tree_for(top_opm, opms = [])
    parent_opm = { opm_id: top_opm.id, opm_name: top_opm.name, subopms: [] }
    if !top_opm.subopms.empty?
      top_opm.subopms.each { |u| parent_opm[:subopms] << self.opm_tree_for(u) }
    end
    return parent_opm
  end

end
