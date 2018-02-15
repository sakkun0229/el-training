class HomeController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    @task = Task.new(content: params[:content])
    if @task.save
      flash[:notice] = "投稿を保存しました"
      redirect_to("/")
    else
      render("home/new")
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.content = params[:content]
    if @task.save
      redirect_to("/")
      flash[:notice] = "変更を保存しました"
    else
      @task.content = params[:content]
      render("task/edit")
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    flash[:notice] = "削除しました"
    redirect_to("/")
  end

end
