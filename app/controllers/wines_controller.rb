class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!

  # GET /wines
  # GET /wines.json
  def index
    @users = User.order(:email)
    @wines = Wine.order(:variety_id,:brand_id)
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        comment = @wine.comments.create
        comment.comment = params[:wine][:note]
        comment.user_id = current_user.id
        comment.save

        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wine }
      else
        format.html { render action: 'new' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        comment = @wine.comments.create
        comment.comment = params[:wine][:note]
        comment.user_id = current_user.id
        comment.save

        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_params
      # ?? pfcass: why don't I need :note here ??
      params.require(:wine).permit(:brand_id, :variety_id, :region_id, :color, :fizz )
    end
end
