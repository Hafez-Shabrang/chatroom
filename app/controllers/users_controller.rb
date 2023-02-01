class UsersController < ApplicationController

  before_action :user_params, only: [:create, :update]
  before_action :find_user_by_id, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:index, :show, :edit, :update, :destroy]
  before_action :login_redirection, only: [:new, :create]
  before_action :user_changes, only: [:destroy, :edit, :update]

  def index
    @users = User.all.page(params[:page])
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User has been created successfully"
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "User has been updated successfully"
      redirect_to @user
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User has been deleted successfully"
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def find_user_by_id
      @user = User.find(params[:id])
    end

    def login_redirection
      if logged_in?
        redirect_to root_path
      end
    end

    def user_changes
      if !current_user.is_admin
        flash[:error] = "You can't delete or edit user"
        redirect_to users_path
      end
    end
end
