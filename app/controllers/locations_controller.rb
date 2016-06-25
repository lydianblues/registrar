class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_filter :staff_only, except: :show

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    render layout: "no_sidebar"
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def datatables

    query = LocationDatatable.gen_sql(params)
    @locations = LocationDatatable.find_by_sql(query)
   
    @draw = params[:draw].to_i
    @recordsTotal = LocationDatatable.count
   
    if params[:search]["value"].blank?
      @recordsFiltered = @recordsTotal
    else
      query = LocationDatatable.count_search_results(params)
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
    def set_location
      @location = Location.find(params[:id])
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :street_1, :street_2, :city,
        :country, :state, :zip, :notes)
    end
end
