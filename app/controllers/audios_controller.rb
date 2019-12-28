class AudiosController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]

def index    #トップページ
end

def show     #楽曲詳細ページ
end

end
