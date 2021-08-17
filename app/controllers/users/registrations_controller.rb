class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.save
    sign_up(resource_name, resource) if resource.persisted?

    render_jsonapi_response(resource)
  end
  # respond_to :json

  # private

  # def respond_with(_resource, _opts = {})
  #   register_success && return if resource.persisted?

  #   register_failed
  # end

  # def register_success
  #   render json: { message: 'Amazing! You have signed up sucessfully.', logged?: false }
  # end

  # def register_failed
  #   render json: { message: 'Opps! Something went wrong. Try to signup again.', logged?: false }
  # end
end
