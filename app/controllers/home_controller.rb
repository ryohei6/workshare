class HomeController < ApplicationController
  def index
    @users = User.all
    if user_signed_in?
      @user = User.find(current_user.id)
    end

    @posts = Post.page(params[:page]).order(created_at: :desc).per(2)
    
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end
end
