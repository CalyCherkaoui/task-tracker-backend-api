module Api
  module V1
    class RoutinesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_routine, only: %w[show destroy update]
      before_action :set_routines, only: %w[index allroutines]

      # GET /routines/:id
      def show
        tasks = @routine.user_tasks(current_user.id)
        # render_jsonapi_response(@routine)

        render jsonapi: tasks,
               status: 200
      end

      # GET /routines
      def index
        if current_user.admin
          render jsonapi: @routines
        else
          routines = Routine.joins(:tasks).where("tasks.user_id = #{current_user.id}").group('id')
          render jsonapi: routines,
                 status: 200
        end
      end

      # PUT /routines/:id
      def update
        @routine.update(routine_params)
        head :no_content
      end

      # POST /routines, params
      def create
        routine = Routine.create(routine_params)
        if routine.save
          render_jsonapi_response(routine)
        else
          render json: routine.errors,
                 status: :unprocessable_entity
        end
      end

      # DELETE /routines/:id
      def destroy
        @routine.destroy
        head :no_content
      end

      private

      def set_routine
        @routine = Routine.find(params[:id])
      end

      def set_routines
        @routines = Routine.priority_sorted
      end

      def routine_params
        params.require(:routine).permit(:name, :priority, :icon)
      end
    end
  end
end
