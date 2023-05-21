class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[create welcome]
  before_action :find_user, only: %i[show update destroy]

  def welcome
    render json: { status: 200, message: 'Welcome to the backend' }
  end

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: { errors: @user.errors.full_messages }, status: 503
    end
  end

  def update
    render json: { errors: @user.errors.full_messages }, status: 503 unless @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :user_name)
  end
end
