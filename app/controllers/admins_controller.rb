class AdminsController < ApplicationController
    before_action :authenticate_admin!
  
    def update
      @admin = current_admin
      if @admin.update(admin_params)  
        render json: @admin
      else
        render json: @admin.errors, status: :unprocessable_entity
      end
    end
    
    def show
      @admin = current_admin
      @reservations = @admin.reservations
    end
  

    def destroy
        @admin = current_admin
        @admin.destroy
        head :no_content
    end
  
    private
  
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
end
  