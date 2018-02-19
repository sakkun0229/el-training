class PostsController < ApplicationController
  def index
    @posts = Post.all
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


end
