class UsersController < ApplicationController
  #編集
  def edit 
  end

  #更新　
  def update
    #ログインしているユーザーの情報を更新する
    #ここで分岐させている
    #更新が保存された場合、チャット画面に戻る
    if current_user.update(user_params)
      redirect_to root_path
      #更新が保存されなかった場合、そのままedit画面のまま
    else
      render :edit
    end
  end
 

def delete
  
end


  private

  def user_params
    #ユーザーの名前とemailの情報を編集を許可している
    params.require(:user).permit(:name, :email)
  end

end
