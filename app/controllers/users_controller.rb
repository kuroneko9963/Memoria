class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      not_found(e)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '登録が完了しました Memoriaへようこそ!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def not_found(e = nil)
      logger.info "Rendering 404 with Exception: #{e.message}" if e
        if request.xhr?
          render json: { error: '404 error' }, status: 404
        else
          render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
        end
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
