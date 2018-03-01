class UsersController < ApplicationController
  before_action :ensure_correct_user,{only:[:edit,:update]}

#userの編集を本人のみに制限
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "情報を更新しました"
      redirect_to("/")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       flash[:notice] = "ログインしました"
       redirect_to("/")
     else
       @error_message = "メールアドレスまたはパスワードが間違っています"
       @email = params[:email]
       render("users/login_form")
     end
  end

  def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/")
  end

end
