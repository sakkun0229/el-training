class PostsController < ApplicationController
  before_action :auth_user!
  
  def index
    @posts = Post.all.order(updated_at: :desc)
  end

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
      redirect_to("/")
    else
      render("posts/new")
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

    if @post.save
      flash[:notice] = "内容を更新しました"
      redirect_to("/")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to("/")
  end

end
