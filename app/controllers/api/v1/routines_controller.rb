module Api
  module V1
    class RoutinesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_routine, only: %w[show destroy update]

      # GET /routines/:id
      def show
          render_jsonapi_response(@routine)
      end

      # GET /routines
      def index
        @routines = Routine.all
        render_jsonapi_response(@routines)
      end

      
      # PUT /routines/:id
      def update
        @routine.update(routine_params)
        head :no_content
      end

      # POST /categories, params
      def create
        routine = routine.create(routine_params)
        if routine.save
          render_jsonapi_response(@routine)
        else
          render json: routine.errors,
                 status: :unprocessable_entity
        end
      end

      # DELETE /Categories/:id
      def destroy
        @routine.destroy
        head :no_content
      end

      private

      def set_routine
        @routine = Routine.find(params[:id])
      end

      def routine_params
        params.require(:routine).permit(:name, :priority, :icon)
      end
    end
  end
end