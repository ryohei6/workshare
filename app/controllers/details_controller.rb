class DetailsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end
end
