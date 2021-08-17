class Users::SessionsController < Devise::SessionsController
  private

  def respond_with(resource, _opts = {})
    render_jsonapi_response(resource)
  end


  def respond_to_on_destroy
    log_out_success
  end

  def log_out_success
    render json: {
      success: [
        {
          message: 'Sayonara! You are logged out. See you soon!',
          status: '200',
          title: 'Logout_success'
        }
      ]
    }, status: 200
  end

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
