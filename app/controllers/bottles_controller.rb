class BottlesController < ApplicationController
  before_action :set_bottle, only: [:show, :edit, :update, :destroy]

  # GET /bottles
  # GET /bottles.json
  def index
    if params[:wine_id] != nil
      @do_search = false
      wine_id = params[:wine_id].to_i
      @bottles = Bottle.visible_bottles(current_user.id, wine_id)
      if @bottles != nil
        @users = User.also_have(@bottles.first)
      else
        @user = []
      end
      @title = "Purchases of Bottles of #{Wine.find(wine_id).name}"
    else
      @do_search = true
      @title = "Search all our bottles"
      @users = []

      @bottles = Bottle.filter(params.slice(:store, :brand, :variety, :region, :color, :fizz))

    end
  end

  # GET /bottles/1
  # GET /bottles/1.json
  def show
  end

  # GET /bottles/new
  def new
    @bottle = Bottle.new
    if params[:wine_id] != NIL
      @wine_id = params[:wine_id]
      @bottle.wine_id = @wine_id
    end
  end

  # GET /bottles/1/edit
  def edit
    this_bottle = Bottle.find(params[:id].to_i)
    @users = User.also_have(this_bottle)
  end

  # POST /bottles
  # POST /bottles.json
  def create
    @bottle = Bottle.new(bottle_params)
    @bottle.user_id = current_user.id
    respond_to do |format|
      if @bottle.save
        format.html { redirect_to user_path(current_user.id), notice: 'Bottle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bottle }
      else
        format.html { render action: 'new' }
        format.json { render json: @bottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bottles/1
  # PATCH/PUT /bottles/1.json
  def update
    respond_to do |format|
      if @bottle.update(bottle_params)
        format.html { redirect_to user_path(current_user.id), notice: 'Bottle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bottles/1
  # DELETE /bottles/1.json
  def destroy
    @bottle.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: 'Bottle was successfully updated.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bottle
    @bottle = Bottle.find(params[:id])
    @is_owner = @bottle.user_id == params[:id].to_i
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bottle_params
    params.require(:bottle).permit(:quantity, :price, :list_price, :rating,
                                   :comment, :wine_id, :store_id, :visibility, :purchased_on)
  end
end
