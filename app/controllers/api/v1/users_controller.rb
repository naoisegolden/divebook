class Api::V1::UsersController < Api::BaseController
  before_action :authenticate!, except: :auth
  before_action :set_user, except: [:index, :auth]
  before_action :return_user, only: :show

  def index
    set_divesite

    @users = paginate @divesite.users

    render json: @users, each_serializer: UserSerializer
  end

  def show
  end

  def update
    if @user.update(user_params)
      return_user
    else
      unprocessable_entity(@user)
    end
  end

  def destroy
    return_user if @user.destroy
  end

  def auth
    @user = User.new(user_params)

    if @user.save
      render json: {
        id: @user.id,
        name: @user.name,
        email: @user.email,
        access_token: @user.authentication_token
      }, status: :created
    elsif @user.invalid?
      unprocessable_entity(@user)
    else
      unexpected_error
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_divesite
    @divesite = Divesite.find(params[:divesite_id])
  end

  def return_user
    render json: @user, serializer: UserSerializer
  end

  def user_params
    params.permit(:name, :email, :password)
  end
end
