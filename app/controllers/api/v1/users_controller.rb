module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user, only: %w[show]
      deserializable_resource :users, only: [:show]

      def show
        if current_user.id == @user.id
          render jsonapi: current_user, include: :tasks,
                 status: 200
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
