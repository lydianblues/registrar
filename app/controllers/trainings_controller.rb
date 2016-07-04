class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_filter :staff_only, except: [:index, :show] # Fix this hole

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
    render layout: "no_sidebar"

  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    
    @trainees = []
    @training.registrations.each do |r|
      if r.registerable_type == 'Student'
        @trainees << {student: r.registerable, group: nil, registration: r}
      else 
        g = r.registerable
        g.students.each do |s| 
          @trainees << {student: s, group: g, registration: r}
        end
      end
    end
  end

  # GET /trainings/new
  def new
    @facilitators = Facilitator.all
    @courses = Course.all
    @locations = Location.all
    @training = Training.new
    # TODO create our own sequence
    query = "select nextval(\'trainings_id_seq\')"
    result = ActiveRecord::Base.connection.execute(query)
    @training.code = 9999 + result[0]["nextval"]
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

   def datatables

    query = TrainingDatatable.gen_sql(params)
    @trainings = TrainingDatatable.find_by_sql(query)
   
    @draw = params[:draw].to_i
    @recordsTotal = TrainingDatatable.count
   
    if params[:search]["value"].blank?
      @recordsFiltered = @recordsTotal
    else
      query = TrainingDatatable.count_search_results(params)
      result = ActiveRecord::Base.connection.execute(query)
      @recordsFiltered = result[0]['count']
    end

    respond_to do |format|
      format.json do
         
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.require(:training).permit(:start_date, :end_date, :code, 
        :formatted_regular_price, :formatted_group_price, :formatted_student_price,
        :formatted_early_student_price, :formatted_early_regular_price, 
        :formatted_early_group_price, :new_registration_closed,
        :min_attendees, :max_attendees,
        :early_registration_cutoff, :course_id, :facilitator_id, :location_id)
    end

    skip_before_action :verify_authenticity_token, :only => [:create]
end
