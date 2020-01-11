class UsersController < ApplicationController

  def index
    @audios = Audio.where(user_id:current_user.id).order("created_at DESC")

  end
  def show
  
  end

end
