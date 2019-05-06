class WorseConditionsController < ApplicationController
  before_action :set_worse_condition, only: [:show, :edit, :update, :destroy]

  # GET /worse_conditions
  # GET /worse_conditions.json
  def index
    @worse_conditions = WorseCondition.all
  end

  # GET /worse_conditions/1
  # GET /worse_conditions/1.json
  def show
  end

  # GET /worse_conditions/new
  def new
    @worse_condition = WorseCondition.new
  end

  # GET /worse_conditions/1/edit
  def edit
  end

  # POST /worse_conditions
  # POST /worse_conditions.json
  def create
    @worse_condition = WorseCondition.new(worse_condition_params)

    respond_to do |format|
      if @worse_condition.save
        format.html { redirect_to @worse_condition, notice: 'Worse condition was successfully created.' }
        format.json { render :show, status: :created, location: @worse_condition }
      else
        format.html { render :new }
        format.json { render json: @worse_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worse_conditions/1
  # PATCH/PUT /worse_conditions/1.json
  def update
    respond_to do |format|
      if @worse_condition.update(worse_condition_params)
        format.html { redirect_to @worse_condition, notice: 'Worse condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @worse_condition }
      else
        format.html { render :edit }
        format.json { render json: @worse_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worse_conditions/1
  # DELETE /worse_conditions/1.json
  def destroy
    @worse_condition.destroy
    respond_to do |format|
      format.html { redirect_to worse_conditions_url, notice: 'Worse condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worse_condition
      @worse_condition = WorseCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worse_condition_params
      params.require(:worse_condition).permit(:content)
    end
end
