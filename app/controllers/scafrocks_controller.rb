class ScafrocksController < ApplicationController
  before_action :set_scafrock, only: [:show, :edit, :update, :destroy]
  before_action :getparams, only: [:new, :edit]

  # GET /scafrocks
  # GET /scafrocks.json
  def index
    @scafrocks = Scafrock.all
  end

  # GET /scafrocks/1
  # GET /scafrocks/1.json
  def show
    unless (1..3) === @scafrock.hand_a and (1..3) === @scafrock.hand_b
      redirect_to(scafrocks_path, notice: 'Please wait until all players complete.')
    end
    
  	@img_fname = [nil, 'r', 's', 'p']
		@result = ['Draw', 'Win!', 'Lose...']
		@numresult = [0, 0]
		if @scafrock.hand_a == @scafrock.hand_b and @scafrock.hand_a != nil
			@numresult = [0, 0]
		elsif (@scafrock.hand_a == 1 and @scafrock.hand_b == 2) or (@scafrock.hand_a == 2 and @scafrock.hand_b == 3) or (@scafrock.hand_a == 3 and @scafrock.hand_b == 1)
			@numresult = [1, 2]
		elsif (@scafrock.hand_a == 1 and @scafrock.hand_b == 3) or (@scafrock.hand_a == 2 and @scafrock.hand_b == 1) or (@scafrock.hand_a == 3 and @scafrock.hand_b == 2)
			@numresult = [2, 1]
		else
			@numresult = [0, 0]
		end
  end

  # GET /scafrocks/new
  def new
    @scafrock = Scafrock.new
    if @scafrock.save
      redirect_to(edit_scafrock_path(@scafrock, player: 'a'), notice: 'New game has started.')
    end
  end

  # GET /scafrocks/1/edit
  def edit
	end

	# POST /scafrocks
  # POST /scafrocks.json
  def create
    @scafrock = Scafrock.new(scafrock_params)

    respond_to do |format|
      if @scafrock.save
        format.html { redirect_to scafrocks_path, notice: 'New game was successfully created.' }
        format.json { render :show, status: :created, location: @scafrock }
      else
        format.html { render :new }
        format.json { render json: @scafrock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scafrocks/1
  # PATCH/PUT /scafrocks/1.json
  def update
    respond_to do |format|
      if @scafrock.update(scafrock_params)
        format.html { redirect_to @scafrock, notice: "Scafrock was successfully updated." }
        format.json { render :show, status: :ok, location: @scafrock }
      else
        format.html { render :edit }
        format.json { render json: @scafrock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scafrocks/1
  # DELETE /scafrocks/1.json
  def destroy
    @scafrock.destroy
    respond_to do |format|
      format.html { redirect_to scafrocks_url, notice: 'Scafrock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scafrock
      @scafrock = Scafrock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scafrock_params
      params.require(:scafrock).permit(:name_a, :hand_a, :name_b, :hand_b)
    end

    def getparams
      @sw = params[:player]
      unless @sw == 'a' or @sw == 'b'
        @label_name = 'invalid params'
		  end
      @label_name = "Player #{@sw}"
    end
    
end
