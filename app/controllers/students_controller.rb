class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # before_filter :authorize, only: [:edit, :update, :destroy]
  before_filter :staff_only, except: [:datatables]

  # GET /students
  # GET /students.json
  def index
    @ajax = true
    @students = Student.all
    render layout: "no_sidebar"
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @trainings = []
    @student.groups.each do |g|
      g.registrations.each do |r|
        @trainings << r.training
      end
    end
    @student.registrations.each do |r|
      @trainings << r.training
    end
    @registrations = Registration.where(owner_id: @student.id).all

  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def datatables
    query = Student.gen_sql(params)
    @students = Student.find_by_sql(query)
   
    @draw = params[:draw].to_i

    if params[:gid].blank?
      @recordsTotal = Student.count
    else
      @group = Group.find(params[:gid])
      query = Student.get_group_size(params)
      result = ActiveRecord::Base.connection.execute(query)
      @recordsTotal = result[0]['count']
    end
   
    if params[:search]["value"].blank?
      @recordsFiltered = @recordsTotal
    else
      query = Student.count_search_results(params)
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
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:wp_login, :wp_first_name, :wp_last_name, :wp_email,
        :wp_display_name, :wp_id, :email_list, :student_discount, :occupation, :organization)
    end
end
