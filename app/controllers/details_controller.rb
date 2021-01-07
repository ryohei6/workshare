class DetailsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def show
    if user_signed_in?
      @user = User.find(current_user.id)
    end

    @post = Post.find_by(id: params[:id])
    @detail = Detail.find_by(id: params[:id])

    @posts = Post.all
    @detail_new = Detail.new
    @details = Detail.all
  end

  def destroy
    #detailテーブルのidを取得する方法を探す
    @detail = Detail.find_by(id: params[:fid])
    @detail.delete
    redirect_to detail_path
  end

  def new
    @detail = Detail.new
    @detail.post_id = params[:post_id]
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def create
    @detail = Detail.new(detail_params)
    @detail.user_id = current_user.id
    #postテーブルのidを取得する方法を探す
    
    @detail.save

  end



  private
  def detail_params
    params.require(:detail).permit(:comment, :post_id)
  end



end
