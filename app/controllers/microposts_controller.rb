class MicropostsController < ApplicationController
  before_action :authenticate_user!,only:[:create,:destroy]
    before_action :correct_user,   only: :destroy

    def show
      @micropost = Micropost.find(params[:id])
      @user = User.find_by(id: @micropost.user_id)

      @microposts=Micropost.all.order(created_at: 'desc')
        
    end

    def new
      @micropost = Micropost.new
    end

    def create
      @micropost = current_user.microposts.build(micropost_params)

        if @micropost.save
          flash[:success] = "Micropost created!"
          redirect_to root_url
        else
          render 'new'
        end
    end

    def destroy
      @micropost.destroy
      flash[:success] = "Micropost deleted"
      redirect_to request.referrer || root_url
    end

    def edit
      @micropost = Micropost.find(params[:id])
    end

    def update
        @micropost = Micropost.find(params[:id])
        if @micropost.update(micropost_params)
            redirect_to root_path
        else
            render 'edit'
        end

    end

    private
  
      def micropost_params
        params.require(:micropost).permit(:title,:content)
      end
      
      def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
      end

end
