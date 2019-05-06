class DaiariesController < ApplicationController
  before_action :set_daiary, only: [:show, :edit, :update, :destroy]

  # GET /daiaries
  # GET /daiaries.json
  def index
    @daiaries = Daiary.all
  end

  # GET /daiaries/1
  # GET /daiaries/1.json
  def show
  end

  # GET /daiaries/new
  def new
    @daiary = Daiary.new
  end

  # GET /daiaries/1/edit
  def edit
  end

  # POST /daiaries
  # POST /daiaries.json
  def create
    @daiary = Daiary.new(daiary_params)

    respond_to do |format|
      if @daiary.save
        format.html { redirect_to @daiary, notice: 'Daiary was successfully created.' }
        format.json { render :show, status: :created, location: @daiary }
      else
        format.html { render :new }
        format.json { render json: @daiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daiaries/1
  # PATCH/PUT /daiaries/1.json
  def update
    respond_to do |format|
      if @daiary.update(daiary_params)
        format.html { redirect_to @daiary, notice: 'Daiary was successfully updated.' }
        format.json { render :show, status: :ok, location: @daiary }
      else
        format.html { render :edit }
        format.json { render json: @daiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daiaries/1
  # DELETE /daiaries/1.json
  def destroy
    @daiary.destroy
    respond_to do |format|
      format.html { redirect_to daiaries_url, notice: 'Daiary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daiary
      @daiary = Daiary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daiary_params
      params.require(:daiary).permit(:title, :start_time)
    end
end
