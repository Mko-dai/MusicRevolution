class AudiosController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]

def index    #トップページ
end

def show     #楽曲詳細ページ
#ユーザーのその他の投稿項目が最新の8項目のみ表示されるようにする
end
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
#mp3ファイル取り出しの例
  # audio = Audio.find(1)
  # audio.file.mp3.url →/uploads/audio/file/1/sample1.mp3
=======
>>>>>>> 2a827a56f1ae1be7de3b9974669def9773ab2fe3
>>>>>>> Stashed changes

def new
end

end
