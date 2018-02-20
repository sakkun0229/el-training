class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name:params[:name],email:params[:email],password:params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザーを登録しました"
      redirect_to("/")
    else
      render("users/new")
    end
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

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to("/")
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
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
