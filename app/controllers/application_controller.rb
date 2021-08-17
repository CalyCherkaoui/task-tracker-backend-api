class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource, status: 200
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def not_found
    render json: {
      errors: [
        {
          message: 'Oops! Not found',
          status: '404',
          title: 'Not_found'
        }
      ]
    }, status: 404
  end

  def errors_not_authorized
    render json: {
      errors:
        [
          {
            message: 'Oops! Admin only! Sorry! You are not authorized!',
            title: 'Not_authorised_user',
            status: 401
          }
        ],
    }, status: 401
  end

  def record_invalid
    render json: {
      'errors': [
        {
          message: 'Oops! something went wrong!',
          status: '400',
          title: 'Invalid Record'
        }
      ]
    }, status: 400
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
