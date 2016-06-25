class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  before_filter :staff_only

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
    render layout: "no_sidebar"
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
    @Registrations = Registration.all
    @groups = Group.all
    @trainings = Training.all
  end

  # GET /registrations/1/edit
  def edit
    @Registrations = Registration.all
    @groups = Group.all
    @trainings = Training.all
  end

  # POST /registrations
  # POST /registrations.json
  def create

    @registration = Registration.new(_registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
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


   def datatables
    query = Registration.gen_sql(:registrations, params)
    @registrations = Registration.find_by_sql(query)
   
    @draw = params[:draw].to_i
    @recordsTotal = Registration.count
   
    if params[:search]["value"].blank?
      @recordsFiltered = @recordsTotal
    else
      query = Registration.count_search_results(:registrations, params)
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
      params.require(:registration).permit(:Registration_id, :group_id, :registerable_type, :paid_for,
        :training_id, :code, :amt_paid, :sign_up_date, :auth_code, :refunded)
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
