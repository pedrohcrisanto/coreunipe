module StaticPagesHelper
  @@applications = {
    'administrador' => ['unidades_completo', 'rh_completo', 'permissao_completo', 'permissao_conceder'],
    'unidades_completo' => 'static_pages/applications/units',
    'rh_completo' => 'static_pages/applications/rh',
    'permissao_completo' => 'static_pages/applications/permissions',
    'p3' => 'static_pages/applications/units',
    'permissao_conceder' => 'static_pages/applications/permissions_users'
  }

  def find_a_way(list)
    apps = []
    list.each do |item|
      permissao = Permission.find_by id: item.permission.id
      result = @@applications[permissao.name]
      if result.instance_of? Array
        result.each do |per|
          apps << @@applications[per]
        end
      else
        apps << result
      end
    end
    apps
  end
end

# def find_a_way(list)
#   retorno = []
#   list.each do |perm|
#     result = @@applications[perm.name]
#     if result.instance_of? Array
#       result.each do |per|
#         retorno << @@applications[per]
#       end
#     else
#       retorno << result
#     end
#   end
#   retorno
# end
