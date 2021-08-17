class Users::SessionsController < Devise::SessionsController
  private

  def respond_with(resource, _opts = {})
    render_jsonapi_response(resource)
  end

  # def respond_with(resource, _opts = {})
  #   render json: { message: 'Greate! Now you are logged in.',
  #                  logged?: true, username: current_user.username,
  #                  email: current_user.email },
  #          status: :ok
  # end

  def respond_to_on_destroy
    # log_out_success && return if current_user

    # log_out_failure
    head :ok
  end

  # def log_out_success
  #   render jsonapi: success_logout_message, status: :ok
  # end

  # def log_out_failure
  #   render jsonapi: errors_response, status: :unauthorized
  # end

  # def login_success_message
  #   {
  #     message: 'Greate! Now you are logged in',
  #     msg_title: 'login_success'
  #   }
  # end

  # def logout_failure_message
  #   {
  #     message: 'Oops! nothing happened. Try to logout again!.',
  #     msg_title: 'logout_failure'
  #   }
  # end

  # def logout_success_message
  #   {
  #     message: 'You are logged out. See you soon!',
  #     msg_title: 'logout_success'
  #   }
  # end
end
