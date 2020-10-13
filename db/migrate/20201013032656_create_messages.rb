class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      #マイグレートの設定は
      #t.type :column options
      t.string  :content
    #外部キーの制約をつける（foreign_key: true ）
    #room_idとuser_idがないと保存できなくする
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
