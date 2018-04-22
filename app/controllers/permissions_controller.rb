class PermissionsController < BaseController

  before_action :load_permissions, only: [:new, :create, :edit, :update]
  before_action :permission_or_not_found, only: [:edit, :update, :destroy]

  def index
    @permissions = Permission.page(params[:page]).per(20)
  end

  def new
    @permission = Permission.new
  end

  def create
    @permission = Permission.new(permission_params)
    if @permission.save
      flash['success'] = "#{@permission.name} criada com sucesso."
      redirect_to permissions_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @permission.update(permission_params)
      flash['success'] = 'Papel atualizado com sucesso.'
      redirect_to permissions_url
    else
      render 'edit'
    end
  end

  def destroy
  end

  protected
    def load_permissions
      @permissions = generate_permissions
    end

    def permission_or_not_found
      @permission = Permission.find_by(id: params[:id])
      if @permission.nil?
        flash['notice'] = 'Papel não encontrado.'
        redirect_to permissions_url
      end
    end

    def permission_params
      permission_params = params.require(:permission).permit(:name, :description, role_ids: [])
      permission_params[:role_ids] = permission_params[:role_ids].concat(roles_ids_for_permissions(params[:permissions]))
      permission_params
    end
end
