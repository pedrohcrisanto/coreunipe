class OpmsController < BaseController

  before_action :opm_or_not_found, only: [:show, :edit, :update, :destroy]

  def new
    @opm = Opm.new
  end

  def index
    @root = Opm.find_by(id: 9) 
    @opms = Opm.page(params[:page]).per(20)
    respond_to do |format|
      format.js { render json: @opms, status: 200 }
      format.html
    end
  end

  def show
  end

  def edit
  end

  def create
    @opm = Opm.new(opm_params)
    if @opm.save
      flash[:success] = "OPM cadastrada"
      redirect_to opms_path
    else
      render 'new'
    end
  end

  def update
    if @opm.update(opm_params)
      flash['success'] = 'OPM atualizada'
      redirect_to opms_path
    else
      render 'edit'
    end
  end

  def destroy
    @opm.destroy
    redirect_to opms_url
  end

  protected

    def opm_or_not_found
      @opm = Opm.find_by(id: params[:id])
      if @opm.nil?
        flash['danger'] = 'OPM não encontrada.'
        redirect_to opms_path
      end

    end
    def opm_params
      params.require(:opm).permit(:name,
                                   :parent_id,
                                   :address,
                                   :zip_code)
    end

end
