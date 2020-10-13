class Room < ApplicationRecord
  #roomモデルはroom_usersを経由してusersモデルへの関係を示している
  #[１対多]の関係であるため
  has_many :room_users
  has_many :users, through: :room_users
end
