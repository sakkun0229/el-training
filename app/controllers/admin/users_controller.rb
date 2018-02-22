class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name:params[:name],email:params[:email],password:params[:password])
    if @user.save
      flash[:notice] = "ユーザーを登録しました"
      redirect_to("/admin/users")
    else
      render("/admin/users/new")
    end
  end


end
