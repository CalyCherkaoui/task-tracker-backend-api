module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
    
      def show
        render json: { message: "Yeppa you did it", username: @user.username, email: @user.email }
      end

      private

      def set_user
        @user = cureent_user!
      end
    end
  end
end
