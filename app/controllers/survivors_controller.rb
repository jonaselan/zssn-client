class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    cookies[:id] = @survivor['id']
    cookies[:name] = @survivor['name']
  end

  def new
    @survivor = Survivor.new
  end

  def edit
  end

  def create
    @survivor = Survivor.new(survivor_params)

    respond_to do |format|
      if @survivor.save
        format.html { redirect_to @survivor, notice: 'Survivor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if Requester.put("survivors/#{params[:id]}", survivor_params)
      flash[:success] = "Survivor was successfully updated."
    else
      flash[:danger] = "Error while trying to edit survivor"
    end

    redirect_to survivor_path params[:id]
  end

  def destroy
    @survivor.destroy
    respond_to do |format|
      format.html { redirect_to survivors_url, notice: 'Survivor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      @survivor = Requester.get("survivors/#{params[:id]}")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survivor_params
      params.permit(:latitude, :longitude)
    end
end
