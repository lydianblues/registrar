class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :staff_only

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    render layout: "no_sidebar"
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @email_addresses = @group.students.map {|s| s.wp_email }
    @email_addresses << @group.owner.wp_email
    @email_addresses = @email_addresses.uniq.join(', ')
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    
    email = params[:group][:owner_email]
    owner = Student.find_by_wp_email!(email)
    @group = Group.new
    @group.owner = owner
    @group.save

    respond_to do |format|
      if @group.save
        @group.init_handle
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def add       
        sp = params[:student]
        email = sp[:wp_email]
        errors = {}
        group = Group.find_by_id(params[:id])

        if group.nil?
            errors[:group] = ["group is missing"]
        else
            student = Student.find_by_wp_email(email) # nil when not found
            if student.nil?
                student = Student.create(
                    wp_first_name: sp[:wp_first_name],
                    wp_last_name: sp[:wp_last_name],
                    wp_email: email,
                    student_discount: (sp[:student_discount] == "1" ? true : false),
                    email_list: (sp[:email_list] == "1" ? true : false),
                    occupation: sp[:occupation],
                    organization: sp[:organization])
            end
            
            if student.errors.empty?
                group.students << student 
            else
                errors = student.errors.messages
            end
        end
        respond_to do |format|
            if errors.empty?
                format.json do
                    render json: student, status: :ok
                end
            else
                format.json do
                    render json: errors, status: :unprocessable_entity
                end
            end
        end
    end

  def remove
    sp = params[:student]
    student = Student.find(sp[:student_id]) # exception when not found
    group = Group.find(params[:id]) # exception when not found
    group.students.delete(student)
    redirect_to action: :show, id: group.id
  end

  def datatables

    query = GroupDatatable.gen_sql(params)
    @groups = GroupDatatable.find_by_sql(query)
   
    @draw = params[:draw].to_i
    @recordsTotal = GroupDatatable.count
   
    if params[:search]["value"].blank?
      @recordsFiltered = @recordsTotal
    else
      query = GroupDatatable.count_search_results(params)
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
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:owner_email)
    end
end
