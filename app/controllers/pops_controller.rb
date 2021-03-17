class PopsController < ApplicationController
  before_action :set_pop, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  

  # GET /pops or /pops.json
  def index
    @pops = Pop.all
  end

  # GET /pops/1 or /pops/1.json
  def show
  end

  # GET /pops/new
  def new
    @pop = Pop.new
  end

  # GET /pops/1/edit
  def edit
  end

  # POST /pops or /pops.json
  def create
    @pop = Pop.new(pop_params)
    @pop.user_id = current_user.id
    respond_to do |format|
      if @pop.save
        format.html { redirect_to @pop, notice: "Pop was successfully created." }
        format.json { render :show, status: :created, location: @pop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pops/1 or /pops/1.json
  def update
    respond_to do |format|
      if @pop.update(pop_params)
        format.html { redirect_to @pop, notice: "Pop was successfully updated." }
        format.json { render :show, status: :ok, location: @pop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pops/1 or /pops/1.json
  def destroy
    @pop.destroy
    respond_to do |format|
      format.html { redirect_to pops_url, notice: "Pop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pop
      @pop = Pop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pop_params
      params.require(:pop).permit(:name, :description, :price, :category, :user_id, :picture)
    end

    def check_user
      if current_user.id == @pop.user_id
        return
        else
        flash[:alert] = "You are not authorised!"
        redirect_to root_path
      end
    end
end
