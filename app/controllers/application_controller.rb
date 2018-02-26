class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  # ログイン済みかどうかを確認する
  # ログインしていなかったら、ログインページにリダイレクトする
  def auth_user!
    if !@current_user
      redirect_to '/login'
      return
    end
  end

  # ログインユーザをセットする
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  

  def auth_admin
    if @current_user.admin != 1
      flash[:notice] = "admin権限がありません"
      redirect_to '/'
      return
    end
  end



end
