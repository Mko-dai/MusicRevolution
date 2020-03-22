class Api::CommentsController < ApplicationController
  def index
    # ルーティングでの設定によりparamsの中にgroup_idというキーでグループのidが入るので、これを元にDBからグループを取得する
   # ajaxで送られてくる最後のメッセージのid番号を変数に代入
   last_comment_id = params[:lastid].to_i
    # 取得したグループでのメッセージ達から、idがlast_messge_idよりも新しい(大きい)メッセージ達のみを取得
   comment1 = Comment.where(audio_id:params[:audio_id]).includes(:user)
   @comment = comment1.where("id > #{last_comment_id}")
   respond_to do |format|
    format.html
    format.json

  end
end
end
