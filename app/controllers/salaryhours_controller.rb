class SalaryhoursController < ApplicationController
    before_action :logged_in_user, only: [:index, :create, :destroy, :edit, :update]

    def new
        @salaryhour = Salaryhour.new
        @user = current_user
      end

    def create
        @salaryhour = Salaryhour.new(salaryhour_params)
        if @salaryhour.save
        flash[:success] = "Entry added!"
        redirect_to current_user
        else
        render 'static_pages/home'
        end
    end
  
    def destroy
        @salaryhour = Salaryhour.find(params[:id])
        @salaryhour.destroy
        redirect_to salaryhour_path(current_user.id)
    end

    def show
       @user = current_user
       @salaryhours = Salaryhour.all
    end

    private
    def salaryhour_params
        params.require(:salaryhour).permit(:hours, :money, :user_id)
    end
end