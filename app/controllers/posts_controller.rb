class PostsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all
    end
    
    @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = cuurent_user.posts.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post.author = current_user
    @post.image.attach(params[:post][:image])
    if @post.save
      redirect_to @post, notice: "投稿しました。"
    else
      render "new"
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.assign_attributes(params[:post])
    if @post.save
      redirect_to @post, notice: "投稿を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to :posts, notice: "投稿を削除しました。"
  end

  private

    def post_params
      params.require(:post).permit(:content, :image)
    end
end
