class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      #中間テーブルなので、チャットルームに参加している[user]と[room]の情報を参照する必要があるため
      #referencesは外部キーを参照できる　foreign_key: trueとセット
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
