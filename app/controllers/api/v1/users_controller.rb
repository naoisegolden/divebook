class Api::V1::UsersController < Api::BaseController
  before_action :set_user, only: :show
  before_action :return_user, only: :show

  def index
    @users = paginate User.all

    render json: @users, each_serializer: UserSerializer
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def return_user
    render json: @user, serializer: UserSerializer
  end
end
