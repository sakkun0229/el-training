class Admin::PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title:params[:title],content:params[:content],deadline:params[:deadline],user_id:@current_user.id)
    if @post.save
      flash[:notice] = "新規タスクを投稿しました"
      redirect_to("/admin/users")
    else
      render("/admin/posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.deadline = params[:deadline]
    @post.status = params[:status]
    @post.priority = params[:priority]

    if @post.save
      flash[:notice] = "内容を更新しました"
      redirect_to("/admin/users")
    else
      render("/admin/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to("/admin/users")
  end

end
