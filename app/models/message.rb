class Message < ApplicationRecord
  #１つのチャットルームに対して、メッセージは複数存在します
  #１人のユーザーは、複数のメッセージを送信できる
  belongs_to :room
  belongs_to :user
end
