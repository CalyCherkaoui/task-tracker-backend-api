module Api
  module V1
    class TasksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_task, only: %w[show destroy update]
      authorize_resource

      # GET /tasks/:id
      def show
        render jsonapi: @task, include: :mesurements,
               fields: { mesurements: %i[id quantity created_at] },
               status: 200
      end

      # GET /tasks
      def index
        render jsonapi: Task.priority_sorted, include: :routines,
               status: 200
      end

      # PUT /tasks/:id
      def update
        @task.update(task_params)
        head :no_content
      end

      # POST /tasks, params
      def create
        task = current_user.tasks.create(task_params)
        if task.save
          render_jsonapi_response(task)
        else
          render json: task.errors,
                 status: :unprocessable_entity
        end
      end

      # DELETE /tasks/:id
      def destroy
        @task.destroy
        head :no_content
      end

      private

      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:name, :priority, :goal, :unit, :routine_id)
      end
    end
  end
end
