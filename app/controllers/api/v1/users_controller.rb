class Api::V1::UsersController < ApplicationController
  def index
    users = paginate User.all

    render json: users, each_serializer: UserSerializer
  end
end
