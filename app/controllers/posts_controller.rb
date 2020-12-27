class PostsController < ApplicationController
  def index
    @post = Post.new
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @posts = Post.all
  end

  def new
    @post = Post.new
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def show
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @post = Post.find(params[:id])

  end

  def create
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    #@post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @post = Post.find(params[:id])
  end

  def update
    if user_signed_in?
      @user = User.find(current_user.id)
    end

    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)

  end

  def destroy
    if user_signed_in?
      @user = User.find(current_user.id)
    end

    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(post.user), notice: "削除しました。"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
