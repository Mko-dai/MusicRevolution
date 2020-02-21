class CommentsController < ApplicationController

def create
  @comment =Comment.new(comments_params)
  if @comment.save
    redirect_to "/audios/#{params[:audio_id]}"
  end
end
private

def comments_params
  params.require(:comment).permit(:comment).merge(user_id:current_user.id,audio_id:params[:audio_id])
end

end