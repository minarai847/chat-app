class MessagesController < ApplicationController
  def index
    #Message.newで生成したmessageモデルのインスタンス変数が代入される
    @message = Message.new
    #paramsに含まれているroom_idを代入される
    #params[:room_id]とすることでroom_idを取得できる
    @room = Room.find(params[:room_id])
    #<↑@room.messagesでチャットルームに紐づいている全てのメッセージを@messagesに代入>
    #全てのメッセージを取得するので、N1+問題が発生する
    #N1+問題とは、メッセージの数と同数のアクセスが必要になるため、動作が重くなる
    #incledeで解決できる　（include:user）でユーザー情報を一度で取得する
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path
    else
      #投稿に失敗した時
      #rendeを用いることで、投稿に失敗した@messageの情報を保持したまま、index.html.erbを参照できる
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

#プライベートメソッドとして、message_paramsを定義し、
#メッセージの内容（content）を
private
def message_params
  params.require(:message).permit(:content).merge(user_id: current_user.id)
end
end