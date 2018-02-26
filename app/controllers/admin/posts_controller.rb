class Admin::PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.deadline = params[:deadline]

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
