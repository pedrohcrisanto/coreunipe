class MilitariesController < BaseController
  before_action :set_military, only: [:show, :edit, :update, :destroy]

  # GET /militaries
  # GET /militaries.json
  def index
    @militaries = Military.all
  end

  # GET /militaries/1
  # GET /militaries/1.json
  def show
  end

  # GET /militaries/new
  def new
    @military = Military.new
  end

  # GET /militaries/1/edit
  def edit
  end

  # POST /militaries
  # POST /militaries.json
  def create
    @military = Military.new(military_params)

    respond_to do |format|
      if @military.save
        format.html { redirect_to @military, notice: 'Military was successfully created.' }
        format.json { render :show, status: :created, location: @military }
      else
        format.html { render :new }
        format.json { render json: @military.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /militaries/1
  # PATCH/PUT /militaries/1.json
  def update
    respond_to do |format|
      if @military.update(military_params)
        format.html { redirect_to @military, notice: 'Military was successfully updated.' }
        format.json { render :show, status: :ok, location: @military }
      else
        format.html { render :edit }
        format.json { render json: @military.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /militaries/1
  # DELETE /militaries/1.json
  def destroy
    @military.destroy
    respond_to do |format|
      format.html { redirect_to militaries_url, notice: 'Military was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_military
      @military = Military.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def military_params
      params.require(:military).permit(:name, :rank, :registration, :admission_date, :t_shirt_size, :boot_size, :beret_size, :pants_size, :user_id)
    end
end
