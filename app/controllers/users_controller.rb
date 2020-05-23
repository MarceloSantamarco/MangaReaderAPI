class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if User.where(email: @user.email).present?
      render json: {error: "Email already exists!"}, status: 401
      return nil
    elsif !params[:password_confirmation] || (params[:password] != params[:password_confirmation])
      render json: {error: "Password and confirmation doesn't match!"}, status: 401
      return nil
    end

    @user.encrypted_password = BCrypt::Password.create(params[:password])

    if @user.save!
      render json: @user, status: :created, location: @user, message: 'User created successfully!'
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :birthdate, :admin, :photo)
    end
end
