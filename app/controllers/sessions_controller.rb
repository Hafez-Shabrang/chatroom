class SessionsController < ApplicationController

  before_action :login_redirection, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have been logged in successfully"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def login_redirection
    if logged_in?
      redirect_to root_path
    end
  end
  
end
