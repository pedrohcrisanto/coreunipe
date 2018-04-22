class UserPermissionsController < ApplicationController


  def index
  end

  def new
    @users = User.all
  end

  def edit
    @user_permissions = UserPermission.where(user_id: params["id"])
    @user = User.find_by_id(params["id"])
    @permissions = Permission.all.pluck(:id, :name)
    @user_permission = UserPermission.new
  end

  def show
  end

  def create
    id = params[:user_permission][:user_id]
    permissao = Permission.find_by_id(params[:user_permission][:permission_id])
    user_permission = UserPermission.new
    user_permission.user_id = params[:user_permission][:user_id]
    user_permission.permission_id = params[:user_permission][:permission_id]
    user_permission.category = params[:user_permission][:category]
    if user_permission.save
      flash[:success] = "Papel cadastrado com sucesso - ( " + permissao.name.humanize + " )"
      redirect_to edit_user_permission_path(id)
    else
      flash[:danger] = "Lamento, o papel não foi cadastrado"
      redirect_to edit_user_permission_path(id)
    end
  end

  def update
  end

  def destroy
    user_perm = UserPermission.find_by_id(params["id"])
    perm_id = user_perm.permission_id
    user_id = user_perm.user_id
    perm_name = Permission.find_by_id(perm_id).name.humanize
    @user_permission = UserPermission.find_by_id(params["id"])
    if @user_permission.destroy
      flash[:success] = "Papel removido com sucesso - ( " + perm_name + " ) "
      redirect_to edit_user_permission_path(user_id)
    end
  end

private

  def user_permission_params
    user_permission_params = params.require(:user_permission).permit(
      :user_id,
      :permission_id,
      :category)
  end
end
