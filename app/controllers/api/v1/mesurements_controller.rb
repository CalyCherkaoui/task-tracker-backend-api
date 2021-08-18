module Api
  module V1
    class mesurementsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_mesurement, only: :destroy

      # POST /categories, params
      def create
        mesurement = mesurement.create(mesurement_params)
        if mesurement.save
          render_jsonapi_response(mesurement)
        else
          render json: mesurement.errors,
                 status: :unprocessable_entity
        end
      end

      # DELETE /Categories/:id
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
