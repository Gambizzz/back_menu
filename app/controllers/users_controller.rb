class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :update, :destroy]
  
    def show
      render json: @user
    end
  
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      head :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end  