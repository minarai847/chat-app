class RoomUser < ApplicationRecord
  #[1 対 1]の関係を表す
  belongs_to :room
  belongs_to :user
end
