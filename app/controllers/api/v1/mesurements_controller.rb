module Api
  module V1
    class MesurementsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_mesurement, only: :destroy
      authorize_resource

      # POST / mesurements, params
      def create
        mesurement = Mesurement.create(mesurement_params)
        if mesurement.save
          render jsonapi: mesurement,
                 status: 200
        else
          render json: mesurement.errors,
                 status: :unprocessable_entity
        end
      end

      # DELETE / mesurements/:id
      def destroy
        @mesurement.destroy
        head :no_content
      end

      private

      def set_mesurement
        @mesurement = mesurement.find(params[:id])
      end

      def mesurement_params
        params.require(:mesurement).permit(:quantity, :task_id)
      end
    end
  end
end
