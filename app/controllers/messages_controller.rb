class MessagesController < ApplicationController
  def index
    #Message.newで生成したmessageモデルのインスタンス変数が代入される
    @message = Message.new
    #paramsに含まれているroom_idを代入される
    #params[:room_id]とすることでroom_idを取得できる
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path
    else
      render :new
    end
  end

#プライベートメソッドとして、message_paramsを定義し、
#メッセージの内容（content）を
private
def message_params
  params.require(:message).permit(:content).merge(user_id: current_user.id)
end
end