class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @microposts = current_user.microposts.build
    end
    @microposts=Micropost.all.order(created_at: 'desc')
   

  end

  def show
    @user = User.find(params[:id])
    @micropost = Micropost.find(params[:id])
  end
end
