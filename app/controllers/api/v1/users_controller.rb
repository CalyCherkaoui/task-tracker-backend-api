# module Api
#   module V1
class API::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: %w[show]

  def show
    if current_user.id == @user.id
      # render json: { message: 'Welcome to your profile',
      #                 username: @user.username,
      #                 currentuser: current_user.username }
      render jsonapi: @user, status: :ok
    else
      render jsonapi: errors_not_authorized
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
#   end
# end
