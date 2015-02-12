class Api::V1::ImagesController < Api::BaseController
  before_action :authenticate!
  before_action :set_image, except: :index
  before_action :return_image, only: :show

  def index
    set_user if params[:user_id].present?
    set_dive if params[:dive_id].present?
    set_divesite if params[:divesite_id].present?

    @images = paginate begin
      if @user.present?
        @user.images
      elsif @dive.present?
        @dive.images
      elsif @divesite.present?
        @divesite.images
      else
        Image.all
      end
    end

    render json: @images, each_serializer: ImageSerializer
  end

  def show
  end

  def destroy
    return_image if @image.destroy
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_dive
    @dive = Dive.find(params[:dive_id])
  end

  def set_divesite
    @divesite = Divesite.find(params[:divesite_id])
  end

  def return_image(status=:ok)
    render json: @image, serializer: ImageSerializer, status: status
  end

  def image_params
    params.permit(:file)
  end
end
