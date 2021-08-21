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

end
