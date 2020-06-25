class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

    # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        if !@user.confirmed && @user.edu_email != nil
          @user.send_confirmation_email(@user)
        end
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirmation
    user_id = params[:id]
    confirmation_token = params[:confirmation_token]
    @user = User.find(user_id)
    user_confirmation_token = @user.confirmation_token

    respond_to do |format|
      if confirmation_token == user_confirmation_token
        @user.confirmation_token = ""
        @user.confirmed = true 
        @user.confirmed_at = DateTime.now
        @user.save!
        format.html { redirect_to @user, notice: 'User .edu email was verified.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_user
    user_id = params[:id]
    @user = User.find(user_id)
    @user.update(user_params)
    @user.send_assignment_email(@user)
    redirect_to list_confirmed_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :email, :username, :role, :edu_email, :desired_role, :desired_disciplines, :first_name,
      :last_name, :organization, :title, :assigned)
    end

end
