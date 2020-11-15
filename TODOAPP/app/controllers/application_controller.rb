class ApplicationController < ActionController::Base
before_action :set_current_user
before_action :set_today

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def set_today
    @today = DateTime.current
  end

  def check_user_post
    post = Post.find_by(id:params[:id])
    if @current_user.id != post.user_id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end

  def check_user_user
    user = User.find_by(id:params[:id])
    if @current_user.id != user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end

  def check_user_completion
    comp = Completion.find_by(id:params[:id])
    if @current_user.id != comp.user_id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end

  def check_login
    if !session[:user_id]
      flash[:notice] = "ログインしてください"
      redirect_to("/users/login_form")
    end
  end


end
