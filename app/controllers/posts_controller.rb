class PostsController < ApplicationController
  def index
    @post = Post.new
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    #@posts = Post.all
    #@posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(2).search(params[:search])
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
    @post = Post.find(params[:id])
    @post.delete
    redirect_to root_path
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :price)
  end

end
