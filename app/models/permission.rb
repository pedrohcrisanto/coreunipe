class Permission < ApplicationRecord

  validates :name, :description, presence: true

  has_many :permission_roles
  has_many :roles, through: :permission_roles

  has_many :user_permissions
  has_many :users, through: :user_permissions

  before_save :underscore_name

  def has_role?(role_name)
    return !self.roles.where(name: role_name).empty?
  end

  def human_name
    self.name.humanize.titleize
  end
  protected
    def underscore_name
      self.name = self.name.parameterize.underscore
    end

end
