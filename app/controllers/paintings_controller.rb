class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:new, :create, :edit, :update]

  # GET /paintings
  # GET /paintings.json
  def index
    @paintings ||= Painting.order(created_at: :desc)
    @profiles ||= Profile.all
    @categories ||= PaintingCategory.all
  end

  # GET /paintings/1
  # GET /paintings/1.json
  def show
  end

  # GET /paintings/new
  def new
    @painting = Painting.new
    @painting.ref_no = Painting.set_ref_no
  end

  # GET /paintings/1/edit
  def edit
  end

  # POST /paintings
  # POST /paintings.json
  def create
    @painting = Painting.new(painting_params)
    respond_to do |format|
      if @painting.save
        format.html { redirect_to paintings_path, notice: 'Painting was successfully created.' }
        format.json { render :show, status: :created, location: @painting }
      else
        format.html { render :new }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paintings/1
  # PATCH/PUT /paintings/1.json
  def update
    respond_to do |format|
      if @painting.update(painting_params)
        format.html { redirect_to paintings_path, notice: 'Painting was successfully updated.' }
        format.json { render :show, status: :ok, location: @painting }
      else
        format.html { render :edit }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paintings/1
  # DELETE /paintings/1.json
  def destroy
    @painting.destroy
    respond_to do |format|
      format.html { redirect_to paintings_path, notice: 'Painting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def artist_paintings
    @profile ||= Profile.find(params[:id])
    @paintings ||= @profile.paintings
    @categories ||= @profile.categories
  end

  def category_paintings
    profile_id = params[:profile_id] ? params[:profile_id] : nil
    @paintings ||= Painting.paintings(params[:id], profile_id)
  end

  private

  def set_list
    @paintings_category_profile ||= Painting.category_profile_list
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_painting
    @painting ||= Painting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def painting_params
    params.require(:painting).permit(:title, :profile_id, :painting_category_id\
      , :ref_no, :year, :width, :height, :style, :price, :price_on_request\
      , :details, :medium, :status, :image, :packing_type)
  end
end
