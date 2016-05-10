class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  # GET /trainings
  # GET /trainings.json
  def index
   
    if params[:course_id] 
      # Be careful of SQL Injection
      @trainings = Training.where("course_id = ?", params[:course_id])
     
      # @filtered_trainings = @trainings.map {|t|
      #   {t.id, t.code, t.location.city}
      #}
    else
      @trainings = Training.all
    end

  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @facilitators = Facilitator.all
    @courses = Course.all
    @locations = Location.all
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
    @facilitators = Facilitator.all
    @courses = Course.all
    @locations = Location.all
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Training was successfully created.' }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: 'Training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.require(:training).permit(:start_date, :end_date, :code, :early_cost,
       :late_cost, :staff_cost, :new_registration_closed,
       :min_attendees, :max_attendees,
       :early_registration_cutoff, :course_id, :facilitator_id, :location_id)
    end

    skip_before_action :verify_authenticity_token, :only => [:create]
end
