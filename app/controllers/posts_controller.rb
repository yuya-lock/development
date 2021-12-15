class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post, notice: "投稿しました。"
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(params[:post])
    if @post.save
      redirect_to @post, notice: "投稿を編集しました。"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :posts
  end
end
