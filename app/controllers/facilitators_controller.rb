class FacilitatorsController < ApplicationController
  before_action :set_facilitator, only: [:show, :edit, :update, :destroy]
  before_filter :staff_only

  # GET /facilitators
  # GET /facilitators.json
  def index
    @facilitators = Facilitator.all
    render layout: "no_sidebar"
  end

  # GET /facilitators/1
  # GET /facilitators/1.json
  def show
  end

  # GET /facilitators/new
  def new
    @facilitator = Facilitator.new
  end

  # GET /facilitators/1/edit
  def edit
  end

  # POST /facilitators
  # POST /facilitators.json
  def create
    @facilitator = Facilitator.new(facilitator_params)

    respond_to do |format|
      if @facilitator.save
        format.html { redirect_to @facilitator, notice: 'Facilitator was successfully created.' }
        format.json { render :show, status: :created, location: @facilitator }
      else
        format.html { render :new }
        format.json { render json: @facilitator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilitators/1
  # PATCH/PUT /facilitators/1.json
  def update
    respond_to do |format|
      if @facilitator.update(facilitator_params)
        format.html { redirect_to @facilitator, notice: 'Facilitator was successfully updated.' }
        format.json { render :show, status: :ok, location: @facilitator }
      else
        format.html { render :edit }
        format.json { render json: @facilitator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilitators/1
  # DELETE /facilitators/1.json
  def destroy
    @facilitator.destroy
    respond_to do |format|
      format.html { redirect_to facilitators_url, notice: 'Facilitator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def datatables

    query = FacilitatorDatatable.gen_sql(params)
    @facilitators = FacilitatorDatatable.find_by_sql(query)
   
    @draw = params[:draw].to_i
    @recordsTotal = FacilitatorDatatable.count
   
    if params[:search]["value"].blank?
      @recordsFiltered = @recordsTotal
    else
      query = FacilitatorDatatable.count_search_results(params)
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
    def set_facilitator
      @facilitator = Facilitator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facilitator_params
      params.require(:facilitator).permit(:name, :description)
    end
end
