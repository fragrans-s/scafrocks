class ScafrocksController < ApplicationController
  before_action :set_scafrock, only: [:show, :edit, :update, :destroy]

  # GET /scafrocks
  # GET /scafrocks.json
  def index
    @scafrocks = Scafrock.all
  end

  # GET /scafrocks/1
  # GET /scafrocks/1.json
  def show
		if @scafrock.hand_a == @scafrock.hand_b and @scafrock.hand_a != nil
			result = 0
			@winner = 'Push'
		elsif (@scafrock.hand_a == 1 and @scafrock.hand_b == 2) or (@scafrock.hand_a == 2 and @scafrock.hand_b == 3) or (@scafrock.hand_a == 3 and @scafrock.hand_b == 1)
			result = 1
			@winner = @scafrock.name_a
		elsif (@scafrock.hand_a == 1 and @scafrock.hand_b == 3) or (@scafrock.hand_a == 2 and @scafrock.hand_b == 1) or (@scafrock.hand_a == 3 and @scafrock.hand_b == 2)
			result = -1
			@winner = @scafrock.name_b
		else
			result = nil
			@winner = 'Invalid Game'
		end
  end

  # GET /scafrocks/new
  def new
    @scafrock = Scafrock.new
  end

  # GET /scafrocks/1/edit
  def edit
=begin
	if player == 1
			@label = 'Player A'
			@active_name = 'name_a'
			@active_hand = 'hand_a'
			@hidden_name = 'name_b'
			@hidden_hand = 'hand_b'
		elsif player == 2
			@label = 'Player B'
			@active_name = 'name_b'
			@active_hand = 'hand_b'
			@hidden_name = 'name_a'
			@hidden_hand = 'hand_a'
		end
=end
	end

	# POST /scafrocks
  # POST /scafrocks.json
  def create
    @scafrock = Scafrock.new(scafrock_params)

    respond_to do |format|
      if @scafrock.save
        format.html { redirect_to @scafrock, notice: 'Scafrock was successfully created.' }
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
	if hand = params[:hand] == 'rock'
			@scafrock.hand_a = 1
		end
    respond_to do |format|
      if @scafrock.update(scafrock_params)
        format.html { redirect_to @scafrock, notice: "Scafrock was successfully updated.  #{hand} <-" }
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
end
