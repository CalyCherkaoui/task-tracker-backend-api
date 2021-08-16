class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { message: 'Greate! Now you are logged in.', logged?: true }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out. See you soon!", logged?: false }, status: :ok
  end

  def log_out_failure
    render json: { message: "Oops! nothing happened. Try to login again!", logged?: false }, status: :unauthorized
  end
end
