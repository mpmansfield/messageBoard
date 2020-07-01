class UserDisciplinesController < ApplicationController
  before_action :set_user_discipline, only: [:show, :edit, :update, :destroy]

  # GET /user_disciplines
  # GET /user_disciplines.json
  def index
    @user_disciplines = UserDiscipline.all
  end

  # GET /user_disciplines/1
  # GET /user_disciplines/1.json
  def show
  end

  # GET /user_disciplines/new
  def new
    @user_discipline = UserDiscipline.new
  end

  # GET /user_disciplines/1/edit
  def edit
  end

  # POST /user_disciplines
  # POST /user_disciplines.json
  def create
    @user_discipline = UserDiscipline.new(user_discipline_params)

    respond_to do |format|
      if @user_discipline.save
        format.html { redirect_to @user_discipline, notice: 'User discipline was successfully created.' }
        format.json { render :show, status: :created, location: @user_discipline }
      else
        format.html { render :new }
        format.json { render json: @user_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_disciplines/1
  # PATCH/PUT /user_disciplines/1.json
  def update
    respond_to do |format|
      if @user_discipline.update(user_discipline_params)
        format.html { redirect_to @user_discipline, notice: 'User discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_discipline }
      else
        format.html { render :edit }
        format.json { render json: @user_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_disciplines/1
  # DELETE /user_disciplines/1.json
  def destroy
    @user_discipline.destroy
    respond_to do |format|
      format.html { redirect_to user_disciplines_url, notice: 'User discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_discipline
      @user_discipline = UserDiscipline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_discipline_params
      params.fetch(:user_discipline, {})
    end
end
