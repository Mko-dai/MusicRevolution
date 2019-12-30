class ArtistsController < ApplicationController
  before_action :authenticate_user!,except: [:show]
  
  def show   #アーティスト紹介ページ
  end

end
