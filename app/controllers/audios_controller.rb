class AudiosController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]

  def index    #トップページ
  end

  def show     #楽曲詳細ページ
  #ユーザーのその他の投稿項目が最新の8項目のみ表示されるようにする
  end
  #mp3ファイル取り出しの例
    # audio = Audio.find(1)
    # audio.file.mp3.url →/uploads/audio/file/1/sample1.mp3
  def new
  @audio = Audio.new
  end
    
  def create
  end

  def update
  end

  def destroy
  end

  def edit
  end

end
