class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  # GET /diaries
  # GET /diaries.json
  def index
    @diaries = current_user.diaries.all
    @sleep_charts = @diaries.pluck(:start_time, :sleep_hour)
  end

  def transition
    @diaries = current_user.diaries.all
    @sleep_charts = @diaries.pluck(:start_time, :sleep_hour)
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
    @diary.build_feeling
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  # POST /diaries.json
  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id

    respond_to do |format|
      if @diary.save
        format.html { redirect_to @diary, notice: 'diary was successfully created.' }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to @diary, notice: 'diary was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to diaries_url, notice: 'diary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_diary
    @diary = Diary.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def diary_params
    params.require(:diary).permit(:title, :start_time, :user_id, :day_icon,
                                  :sleep_label, :sleep_hour, :getup_at, :sleep_at,
                                  :day_action, :halfway_awakening, feeling_attributes:[:id, :morning_feel, :noon_feel, :night_feel])
  end
end
