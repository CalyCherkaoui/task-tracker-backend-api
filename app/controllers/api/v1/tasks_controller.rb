module Api
  module V1
    class TasksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_task, only: %w[show destroy update]

      # GET /tasks/:id
      def show
        render_jsonapi_response(@task)
      end

      # GET /tasks
      def index
        render jsonapi: Task.all # includes last measurement
      end

      # PUT /tasks/:id
      def update
        @task.update(task_params)
        head :no_content
      end

      # POST /categories, params
      def create
        task = current_user.tasks.create(task_params)
        if task.save
          render_jsonapi_response(task)
        else
          render json: task.errors,
                 status: :unprocessable_entity
        end
      end

      # DELETE /Categories/:id
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
