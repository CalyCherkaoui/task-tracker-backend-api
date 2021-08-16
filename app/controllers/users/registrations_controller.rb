class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Amazing! You have signed up sucessfully.', logged?: true }
  end

  def register_failed
    render json: { message: 'Opps! Something went wrong. Try to signup again.', logged?: false }
  end
end
