class Api::V1::DivesitesController < Api::BaseController
  before_action :authenticate!
  before_action :set_divesite, except: [:index, :create]
  before_action :return_divesite, only: :show

  def index
    set_user if params[:user_id].present?

    @divesites = paginate(@user.present? ? @user.divesites : Divesite.all)

    render json: @divesites, each_serializer: DivesiteSerializer
  end

  def create
    @divesite = Divesite.new(divesite_params)

    if @divesite.save
      return_divesite(:created)
    elsif @divesite.invalid?
      unprocessable_entity(@divesite)
    else
      unexpected_error
    end
  end

  def show
  end

  def update
    if @divesite.update(divesite_params)
      return_divesite
    else
      unprocessable_entity(@divesite)
    end
  end

  def destroy
    return_divesite if @divesite.destroy
  end

  private

  def set_divesite
    @divesite = Divesite.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def return_divesite(status=:ok)
    render json: @divesite, serializer: DivesiteSerializer, status: status
  end

  def divesite_params
    params.permit(:name, :address)
  end
end
