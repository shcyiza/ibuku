class OriginTypesController < ApplicationController
  before_action :set_origin_type, only: [:show, :edit, :update, :destroy]

  # GET /origin_types
  # GET /origin_types.json
  def index
    @origin_types = OriginType.all
  end

  # GET /origin_types/1
  # GET /origin_types/1.json
  def show
  end

  # GET /origin_types/new
  def new
    @origin_type = OriginType.new
  end

  # GET /origin_types/1/edit
  def edit
  end

  # POST /origin_types
  # POST /origin_types.json
  def create
    @origin_type = OriginType.new(origin_type_params)

    respond_to do |format|
      if @origin_type.save
        format.html { redirect_to @origin_type, notice: 'Origin type was successfully created.' }
        format.json { render :show, status: :created, location: @origin_type }
      else
        format.html { render :new }
        format.json { render json: @origin_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /origin_types/1
  # PATCH/PUT /origin_types/1.json
  def update
    respond_to do |format|
      if @origin_type.update(origin_type_params)
        format.html { redirect_to @origin_type, notice: 'Origin type was successfully updated.' }
        format.json { render :show, status: :ok, location: @origin_type }
      else
        format.html { render :edit }
        format.json { render json: @origin_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /origin_types/1
  # DELETE /origin_types/1.json
  def destroy
    @origin_type.destroy
    respond_to do |format|
      format.html { redirect_to origin_types_url, notice: 'Origin type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_origin_type
      @origin_type = OriginType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def origin_type_params
      params.require(:origin_type).permit(:name)
    end
end
