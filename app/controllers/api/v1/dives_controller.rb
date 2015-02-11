class Api::V1::DivesController < Api::BaseController
  before_action :authenticate!
  before_action :set_dive, except: [:index, :create]
  before_action :return_dive, only: :show

  def index
    set_user if params[:user_id].present?
    set_divesite if params[:divesite_id].present?

    @dives = paginate begin
      if @user.present?
        @user.dives
      elsif @divesite.present?
        @divesite.dives
      else
        Dive.all
      end
    end

    render json: @dives, each_serializer: DiveSerializer
  end

  def create
    @dive = Dive.new(dive_params)

    if @dive.save
      return_dive(:created)
    elsif @dive.invalid?
      unprocessable_entity(@dive)
    else
      unexpected_error
    end
  end

  def show
  end

  def update
    if @dive.update(dive_params)
      return_dive
    else
      unprocessable_entity(@dive)
    end
  end

  def destroy
    return_dive if @dive.destroy
  end

  private

  def set_dive
    @dive = Dive.find(params[:id])
  end

  def set_divesite
    @divesite = Divesite.find(params[:divesite_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def return_dive(status=:ok)
    render json: @dive, serializer: DiveSerializer, status: status
  end

  def dive_params
    params.permit(:user_id, :divesite_id, :date)
  end
end
