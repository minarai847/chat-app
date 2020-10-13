class Message < ApplicationRecord
  #１つのチャットルームに対して、メッセージは複数存在します
  #１人のユーザーは、複数のメッセージを送信できる
  belongs_to :room
  belongs_to :user
  #各レコードとファイルを１対１の関係で紐づけるメソッド
  #imageファイル
  has_one_attached :image
  #contentカラム（メッセージが入るところ）が空だとDBには保存しないという指令
  validates :content, presence: true
end
