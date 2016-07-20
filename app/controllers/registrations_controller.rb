class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  before_action :staff_only

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
    render layout: "no_sidebar"
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    if @registration.registerable_type == "Student"
      @registrants = [@registration.registerable]
    else
      @registrants= @registration.registerable.students.to_a
    end
    @registrants
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
    @trainings = Training.all
    # Or something like:
    # Training.where('start_date > ?', Date.today - 3.days)
  end

  # GET /registrations/1/edit
  def edit
    @Registrations = Registration.all
    @groups = Group.all
    @trainings = Training.all # Training.where('start_date > ?', Date.today)
  end

  # POST /registrations
  # POST /registrations.json
  def create
    p = params[:registration]
    byebug
    training = Training.find_by_code(p[:training_code])
    owner = Student.find_by_wp_email(p[:owner_email])
    reg_type = p[:reg_type]
    if reg_type == 'single-self'
      registerable = owner
    elsif reg_type == 'single-other'
      registerable = Student.find_by_email(p[:registrant_email])
    else 
      registerable = Group.find_by_handle(p[:group_handle])
    end
    @registration = Registration.new(reg_type: reg_type)
    @registration.owner = owner
    @registration.registerable = registerable
    @registration.training = training

    # Fix this.  We need to have a sequence in the database.
    @registration.code  = 100000 + rand(900000)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html do
          @trainings = Training.all
          render :new
        end
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(_registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def datatables

    query = RegistrationDatatable.gen_sql(params)
    @registrations = RegistrationDatatable.find_by_sql(query)
   
    @draw = params[:draw].to_i
    @recordsTotal = RegistrationDatatable.count
   
    if params[:search]["value"].blank?
      @recordsFiltered = @recordsTotal
    else
      query = RegistrationDatatable.count_search_results(params)
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
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:Registration_id, :group_id, 
        :registerable_type, :paid_for,
        :training_id, :code, :amt_paid, :sign_up_date, :auth_code, :refunded,
        :training_code, :owner_email, :reg_type, :registrant_email, :group_handle)
    end

    def _registration_params
      #
      # Fix the registration params problems caused by 
      # simple_form not handling the polymorphism properly.
      #
      p = registration_params # a function call
      p[:registerable_id] = if p[:registerable_type] == "Registration"
        p[:Registration_id]
      elsif p[:registerable_type] == "Group"
        p[:group_id]
      end
      p.delete(:Registration_id)
      p.delete(:group_id)
      return p
    end
end
