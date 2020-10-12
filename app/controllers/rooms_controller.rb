class RoomsController < ApplicationController
  #チャットルームの新規作成なので、newアクション
  def new
    #値が空のRoomインスタンスを@roomに代入している
    @room = Room.new
  end
  
end
