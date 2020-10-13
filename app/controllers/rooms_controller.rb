class RoomsController < ApplicationController
  #チャットルームの新規作成なので、newアクション
  def new
    #値が空のRoomインスタンスを@roomに代入している
    @room = Room.new
  end

  def index
  end
  

  def create
    @room = Room.new(room_params)
    #保存(save)が成功したかどうかで処理を分岐させている
    #成功した場合、ルートパスにリダイレクトし
    #失敗した場合、rooms/new.html.erbのページを表示して
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end

  
end
