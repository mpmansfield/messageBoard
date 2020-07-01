class DisciplineRequestsController < ApplicationController
  before_action :set_discipline_request, only: [:show, :edit, :update, :destroy]

  # GET /discipline_requests
  # GET /discipline_requests.json
  def index
    @discipline_requests = DisciplineRequest.all
  end

  # GET /discipline_requests/1
  # GET /discipline_requests/1.json
  def show
  end

  # GET /discipline_requests/new
  def new
    @discipline_request = DisciplineRequest.new
  end

  # GET /discipline_requests/1/edit
  def edit
  end

  # POST /discipline_requests
  # POST /discipline_requests.json
  def create
    @discipline_request = DisciplineRequest.new(discipline_request_params)

    respond_to do |format|
      if @discipline_request.save
        format.html { redirect_to @discipline_request, notice: 'Discipline request was successfully created.' }
        format.json { render :show, status: :created, location: @discipline_request }
      else
        format.html { render :new }
        format.json { render json: @discipline_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discipline_requests/1
  # PATCH/PUT /discipline_requests/1.json
  def update
    respond_to do |format|
      if @discipline_request.update(discipline_request_params)
        format.html { redirect_to @discipline_request, notice: 'Discipline request was successfully updated.' }
        format.json { render :show, status: :ok, location: @discipline_request }
      else
        format.html { render :edit }
        format.json { render json: @discipline_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discipline_requests/1
  # DELETE /discipline_requests/1.json
  def destroy
    @discipline_request.destroy
    respond_to do |format|
      format.html { redirect_to discipline_requests_url, notice: 'Discipline request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline_request
      @discipline_request = DisciplineRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discipline_request_params
      params.require(:discipline_request).permit(:user_id, :discipline_id)
    end
end
