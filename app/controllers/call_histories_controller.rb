class CallHistoriesController < ApplicationController
  before_action :set_call_history, only: [:show, :edit, :update, :destroy]

  # GET /call_histories
  # GET /call_histories.json
  def index
    @call_histories = CallHistory.all
  end

  # GET /call_histories/1
  # GET /call_histories/1.json
  def show
  end

  # GET /call_histories/new
  def new
    @call_history = CallHistory.new
  end

  # GET /call_histories/1/edit
  def edit
  end

  # POST /call_histories
  # POST /call_histories.json
  def create
    @call_history = CallHistory.new(call_history_params)

    respond_to do |format|
      if @call_history.save
        format.html { redirect_to @call_history, notice: 'Call history was successfully created.' }
        format.json { render :show, status: :created, location: @call_history }
      else
        format.html { render :new }
        format.json { render json: @call_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /call_histories/1
  # PATCH/PUT /call_histories/1.json
  def update
    respond_to do |format|
      if @call_history.update(call_history_params)
        format.html { redirect_to @call_history, notice: 'Call history was successfully updated.' }
        format.json { render :show, status: :ok, location: @call_history }
      else
        format.html { render :edit }
        format.json { render json: @call_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_histories/1
  # DELETE /call_histories/1.json
  def destroy
    @call_history.destroy
    respond_to do |format|
      format.html { redirect_to call_histories_url, notice: 'Call history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call_history
      @call_history = CallHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def call_history_params
      params.require(:call_history).permit(:caller_name, :caller_mobile, :username, :user_mobile, :date)
    end
end
