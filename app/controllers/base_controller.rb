class BaseController < ApplicationController

  include PermissionsService

  before_action :require_action_role

  protected
    def require_action_role
      role_name = "#{params[:controller]}_#{params[:action]}"
      raise PmpbException::SecurityTransgressionException unless current_user.has_role?(role_name)
    end

end
