class BetterConditionsController < ApplicationController
  before_action :set_better_condition, only: [:show, :edit, :update, :destroy]

  # GET /better_conditions
  # GET /better_conditions.json
  def index
    @better_conditions = BetterCondition.all
  end

  # GET /better_conditions/1
  # GET /better_conditions/1.json
  def show
  end

  # GET /better_conditions/new
  def new
    @better_condition = BetterCondition.new
  end

  # GET /better_conditions/1/edit
  def edit
  end

  # POST /better_conditions
  # POST /better_conditions.json
  def create
    @better_condition = BetterCondition.new(better_condition_params)

    respond_to do |format|
      if @better_condition.save
        format.html { redirect_to @better_condition, notice: 'Better condition was successfully created.' }
        format.json { render :show, status: :created, location: @better_condition }
      else
        format.html { render :new }
        format.json { render json: @better_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /better_conditions/1
  # PATCH/PUT /better_conditions/1.json
  def update
    respond_to do |format|
      if @better_condition.update(better_condition_params)
        format.html { redirect_to @better_condition, notice: 'Better condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @better_condition }
      else
        format.html { render :edit }
        format.json { render json: @better_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /better_conditions/1
  # DELETE /better_conditions/1.json
  def destroy
    @better_condition.destroy
    respond_to do |format|
      format.html { redirect_to better_conditions_url, notice: 'Better condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_better_condition
      @better_condition = BetterCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def better_condition_params
      params.require(:better_condition).permit(:content, :string)
    end
end
