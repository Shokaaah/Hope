class UsersController < ApplicationController
  def index
  	@user = User.all
  end

  def new
    @user = User.new
  end

  def show
  	@user = current_user
  	#@user = User.find(params[:id])
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
  end

end
