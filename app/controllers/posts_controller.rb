class PostsController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new

  end

  def create
    @post = Post.new(title:params[:title],content:params[:content])
    @post.save
    redirect_to("/")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to("/")
  end

end
