module Api
  module V1
    class AllroutinesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_routines, only: %w[index]

      # GET /allroutines
      def index
        render json: RoutinesRepresenter.new(@routines).as_json, status: 200
      end

      private

      def set_routines
        @routines = Routine.priority_sorted
      end
    end
  end
end
