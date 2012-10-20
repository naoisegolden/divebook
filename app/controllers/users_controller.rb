class UsersController < ApplicationController

  def index
    @users = User.all
  end

	def new
		@user = User.new
	end

	def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User created successfully."
      redirect_to root_path
    else
      flash[:error] = "Something went wrong."
      render :action => 'new'
    end
  end
end
