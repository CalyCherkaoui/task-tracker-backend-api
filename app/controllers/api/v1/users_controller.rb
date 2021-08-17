module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user, only: %w[show]

      def show
        if current_user.id == @user.id
          # render json: { message: 'Welcome to your profile',
          #                 username: @user.username,
          #                 currentuser: current_user.username }
          render_jsonapi_response(current_user)
        else
          errors_not_authorized
        end
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
