class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Workster! Update your information and add additional hours worked using the toolbar above."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :salary, :start_time, :end_time, :password,
                                   :password_confirmation)
    end
end