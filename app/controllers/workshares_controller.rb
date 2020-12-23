class WorksharesController < ApplicationController
  before_action :set_workshare, only: [:show, :edit, :update, :destroy]

  # GET /workshares
  # GET /workshares.json
  def index
    @workshares = Workshare.all
  end

  # GET /workshares/1
  # GET /workshares/1.json
  def show
  end

  # GET /workshares/new
  def new
    @workshare = Workshare.new
  end

  # GET /workshares/1/edit
  def edit
  end

  # POST /workshares
  # POST /workshares.json
  def create
    @workshare = Workshare.new(workshare_params)

    respond_to do |format|
      if @workshare.save
        format.html { redirect_to @workshare, notice: 'Workshare was successfully created.' }
        format.json { render :show, status: :created, location: @workshare }
      else
        format.html { render :new }
        format.json { render json: @workshare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshares/1
  # PATCH/PUT /workshares/1.json
  def update
    respond_to do |format|
      if @workshare.update(workshare_params)
        format.html { redirect_to @workshare, notice: 'Workshare was successfully updated.' }
        format.json { render :show, status: :ok, location: @workshare }
      else
        format.html { render :edit }
        format.json { render json: @workshare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshares/1
  # DELETE /workshares/1.json
  def destroy
    @workshare.destroy
    respond_to do |format|
      format.html { redirect_to workshares_url, notice: 'Workshare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshare
      @workshare = Workshare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workshare_params
      params.require(:workshare).permit(:title, :body)
    end
end
