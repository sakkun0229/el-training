class UsersController < ApplicationController
  def index
    @users = User.all
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
       @password = params[:password]

       render("users/login_form")
     end
   end

end
