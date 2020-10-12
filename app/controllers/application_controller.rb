class ApplicationController < ActionController::Base
  #ログインしていないユーザーをログインページの画面に促すことができます
  before_action :authenticate_user!
#悪意のあるユーザーの入力に対してセキュリティ対策を行わないと保存できない仕組みがあります。
#この記述をすることで、全てのアクションをするにあたって、名前を聞いてくる
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  def configure_permitted_parameters
    #「nameカラム」を追加したので、このメソッドを使用し、「name」キーの内容の保存をpermitメソッドで許可しています。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end
end
