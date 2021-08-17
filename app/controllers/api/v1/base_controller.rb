class Api::V1::BaseController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: {
      errors: [
        {
          status: '404',
          title: 'Not Found'
        }
      ]
    }, status: 404
  end

  def errors_not_authorized
    render json: {
      errors:
        [
          { message: 'Oops! Admin only! Sorry! You are not authorized!' }
        ],
      title: 'Not authorized action',
      status: 401
    }
  end
end
