class Users::ProfileController < ApplicationController
    def update
        @user = current_user
        if @user.update(user_params)
          render json: { message: 'Profile updated successfully' }, status: :ok
        else
          render json: { error: 'Failed to update profile' }, status: :unprocessable_entity
        end
      end
    
      private
    
      def user_params
        params.require(:user).permit(:first_name, :last_name, :bio)
      end
end
