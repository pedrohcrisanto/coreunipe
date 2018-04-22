class TriagemsController < ApplicationController
  before_action :set_triagem, only: [:show, :edit, :update, :destroy]

  # GET /triagems
  # GET /triagems.json
  def index
    @triagems = Triagem.all
  end

  # GET /triagems/1
  # GET /triagems/1.json
  def show
  end

  # GET /triagems/new
  def new
    @triagem = Triagem.new
  end

  # GET /triagems/1/edit
  def edit
  end

  # POST /triagems
  # POST /triagems.json
  def create
    @triagem = Triagem.new(triagem_params)

    respond_to do |format|
      if @triagem.save
        format.html { redirect_to @triagem, notice: 'Triagem was successfully created.' }
        format.json { render :show, status: :created, location: @triagem }
      else
        format.html { render :new }
        format.json { render json: @triagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /triagems/1
  # PATCH/PUT /triagems/1.json
  def update
    respond_to do |format|
      if @triagem.update(triagem_params)
        format.html { redirect_to @triagem, notice: 'Triagem was successfully updated.' }
        format.json { render :show, status: :ok, location: @triagem }
      else
        format.html { render :edit }
        format.json { render json: @triagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /triagems/1
  # DELETE /triagems/1.json
  def destroy
    @triagem.destroy
    respond_to do |format|
      format.html { redirect_to triagems_url, notice: 'Triagem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_triagem
      @triagem = Triagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def triagem_params
      params.require(:triagem).permit(:nome_paciente, :desc_hist_tratamento, :desc_hist_medic, :psicoterapia, :queixa, :estado_paciente)
    end
end
