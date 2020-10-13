class Room < ApplicationRecord
  #roomモデルはroom_usersを経由してusersモデルへの関係を示している
  #[１対多]の関係であるため
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
#チャットルームを作成するにあたって、ルーム名が必要なので、
#ルーム名が存在する場合のみ、作成可(true)
  validates :name, presence: true
end
