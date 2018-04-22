class UsersController < BaseController

  before_action :load_permissions, only: [:new, :edit, :create, :update]
  before_action :user_or_not_found, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    @user.build_person
    @user.person.build_address
  end

  def index
    busca = params[:search].present? ? params[:search] : {}
    @users = User.search(busca).page(params[:page]).per(20)
    respond_to do |format|
      format.js { render json: @users, status: 200 }
      format.html
    end
  end

  def show
  end

  def edit
  end

  def create
  #
  # #   permissions = [
  # #   { permission_id: 1, category: 'category' },
  # #   { permission_id: 2, category: 'funcional' }
  # # ]
  #
  # permissions.each do |p|
  #   permission = UserPermission.new(permission_id: p[:permission_id], user_id: @user.id, category: p[:category])
  # end

    @user = User.new(user_params)
    generate_default_password
    permission_ids = params[:permission_ids]
    category = params[:category]
    if @user.save
      permission_ids.each do |p|
        user_permission = UserPermission.new(permission_id: p, user_id: @user.id, category: category)
        user_permission.save
      end
      flash[:success] = "Usuario cadastrado"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash['success'] = 'Usuario atualizado'
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def update_permission
    respond_to do |format|
      if @user.update(user_params)
        format.json{
          render json: @user,
          status: :updated,
          location: @user
        }
      else
        format.json{
          render json: @users.errors,
          status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  protected

    def load_permissions
      @permissions = generate_permissions
      @permissions.each do |i|
          puts  'ola '
          puts i
      end
    end

    def generate_default_password
      @user.password = '12345678'
      @user.password_confirmation = '12345678'
    end

    def user_or_not_found
      @user = User.find_by(id: params[:id])
      if @user.nil?
        flash['danger'] = 'Usuario não encontrado.'
        redirect_to users_path
      end

    end

    def user_params
      user_params = params.require(:user).permit(
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :opm_id,
                                   permission_ids: [],
                                   person_attributes: [
                                   :full_name,
                                   :mobile_phone,
                                   :home_phone,
                                   :birth_date,
                                   :rg,
                                   :cpf,
                                   address_attributes: [
                                   :street,
                                   :number,
                                   :district,
                                   :zip,
                                   :city,
                                   :state]])
      user_params[:permission_ids] = user_params[:permission_ids].concat(params[:permission_ids])
      user_params
    end

end
