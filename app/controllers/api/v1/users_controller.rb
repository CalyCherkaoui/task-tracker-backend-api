module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user

      def show
        if current_user.id == @user.id
          render json: { message: 'Welcome to your profile',
                         username: @user.username,
                         currentuser: current_user.username }
        else
          render json: { message: 'You are not authorize!', currentuser: current_user.username }
        end
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
