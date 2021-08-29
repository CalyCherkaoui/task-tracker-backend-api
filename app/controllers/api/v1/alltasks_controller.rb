module Api
  module V1
    class AlltasksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_tasks, only: %w[index]

      # GET /alltasks
      def index
        render json: tasksRepresenter.new(@tasks).as_json, status: 200
      end

      private

      def set_tasks
        @tasks = current_user.priority_sorted
      end

    end
  end
end