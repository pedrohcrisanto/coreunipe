class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :military
  has_one :situation

  has_many :placements
  has_many :opms, through: :placements
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :user_permissions
  has_many :permissions, through: :user_permissions
  has_many :user_sessions

  belongs_to :person
  accepts_nested_attributes_for :person
  belongs_to :opm

  # validates :first_name, :last_name, :email, presence: true

  before_save :get_roles_from_permissions

  # Dynamic check for user role using the method pattern: has_role_*?
  def method_missing(method_name, *args)
    super if !method_name.to_s.match(/^has_role_(.*)\?$/)
    role_name = method_name.to_s.gsub(/(^has_role_|\?$)/, '')
    has_role?(role_name)
  end

  def update_current_placement
    if !self.opm.nil?
      current_placement = self.placements.last
      current_placement.end_date = Date.now unless current_placement.nil?
      Placement.create(user: self, opm: self.opm, start_date: Date.now)
    end
  end

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  scope :filter_by_first_name, lambda { |keyword| where("lower(first_name) LIKE ?", "%#{keyword.downcase}%") }
  scope :filter_by_last_name, lambda { |keyword| where("lower(last_name) LIKE ?", "%#{keyword.downcase}%") }
  scope :filter_by_opm_ids, lambda { |opm_ids| where("opm_id IN (?)", opm_ids) }

  def self.search(params = {})
    users = User.all
    if params[:opms_id].present?
      users = User.filter_by_opm_ids(params[:opm_ids])
    elsif params[:opms_id].present? && params[:opms_id].empty?
      users = User.none
    end
    users = users.filter_by_first_name(params[:first_name]) if params[:first_name].present?
    # users = users.filter_by_last_name(params[:last_name]) if params[:last_name].present?
    # users = users.filter_by_opm_ids(params[:opm_ids]) if params[:opm_ids].present?
    users
  end

  # Find user by token
  def self.find_by_token(token)
    token = UserSession.find_by(token: token)
    if !token.nil? && token.expire_date > Time.now
      token.user
    else
      nil
    end
  end

  def has_role?(role_name)
    !self.roles.where(name: role_name).empty?
  end

  def has_permission?(permission_name)
    !self.permissions.where(name: permission_name).empty?
  end

  protected
    def get_roles_from_permissions
      self.roles = self.permissions.map { |p| p.roles }.flat_map { |role| role }
    end

end
