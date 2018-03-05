class PostsController < ApplicationController
  before_action :auth_user!
  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}


  #投稿の編集を本人のみに制限
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  def index
    @posts = Post.search(params[:search])
    if params[:sort] == 'updated_at'
      @posts = Post.all.order(updated_at: :desc)
    else params[:sort] == 'deadline'
      @posts = Post.all.order(deadline: :desc)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title:params[:title],content:params[:content],deadline:params[:deadline],status:0,user_id:@current_user.id)
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
    @post.status = params[:status].to_i
    @post.priority = params[:priority].to_i

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
