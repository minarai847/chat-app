class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #validates カラム,presence:true
         #nameカラムが空の場合データベースに保存しない
         validates :name, presence:true

end
