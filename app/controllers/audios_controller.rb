class AudiosController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]

def index    #トップページ
end

def show     #楽曲詳細ページ
#ユーザーのその他の投稿項目が最新の8項目のみ表示されるようにする
end

def new
end

end
