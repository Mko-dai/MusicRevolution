class UsersController < ApplicationController

  def index
    @audios = Audio.where(user_id:current_user.id).order("created_at DESC")
  end
  
  def show
    @user = User.find(params[:id])
    @audios = Audio.where(user_id:@user.id).order("created_at DESC")
  end

  def update
  @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:introduction,:userimage,:backgroundimage)
  end
end
