class AudiosController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :set_audio,except: [:index,:new,:create]
  
  def index    #トップページ
    @audios = Audio.order("created_at DESC")
  end

  def show     #楽曲詳細ページ
    #ユーザーのその他の投稿項目が最新の8項目のみ表示されるようにする
    @useraudio = Audio.where(user_id:@audio.user_id).order("created_at DESC").limit(8)
  end
  
  #mp3ファイル取り出しの例
    # audio = Audio.find(1)
    # audio.file.mp3.url →/uploads/audio/file/1/sample1.mp3
  def new
    @audio = Audio.new
  end
    
  def create
    # DB登録時、artistnameまたはartist_idが入っていれば登録できるようにする！
    @audio=Audio.new(audio_params)
    if @audio.save
      redirect_to root_path
    else
      redirect_to new_audio_path
    end
  end

  def update
    if @audio.update(audio_params)
      redirect_to "/audios/#{@audio.id}"
    end
  end

  def destroy
    if @audio.destroy
      redirect_to root_path
    end
  end

  def edit
  end

  private

  def audio_params
    params.require(:audio).permit(:title,:category,:image,:file,:description,:artistname).merge(user_id: current_user.id,artist_id:1)
  end

  def set_audio
    @audio = Audio.find(params[:id])
  end
end
