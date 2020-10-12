class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      #設計書を見て、type :colum, opptionの順番に記述する
      t.string :name,null: false
      t.timestamps
    end
  end
end
