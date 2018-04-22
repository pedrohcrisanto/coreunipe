class StaticPagesController < ApplicationController
  include StaticPagesHelper

  def index
    @applications = find_a_way(current_user.user_permissions.where(category: "funcional"))
    @applications_add = find_a_way(current_user.user_permissions.where(category: "adicional"))
    @applications_generics = find_a_way(current_user.user_permissions.where(category: "generico"))
  end

end
