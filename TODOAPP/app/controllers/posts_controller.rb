class PostsController < ApplicationController
  before_action :check_login
  before_action :check_user_post , {only: [:show, :edit, :update, :delete]}


  def index
    @posts = Post.where(user_id:@current_user.id).order(deadline: :asc)

  end

  def index_over
    @posts = Post.where(user_id:@current_user.id).order(deadline: :asc)
  end

  def index_none
    @posts = Post.where(user_id:@current_user.id).order(deadline: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(content: params[:content] , deadline: params[:deadline] , user_id:@current_user.id)
    if @post.save
      flash[:notice] = "新たなTODOを追加しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.deadline
      @deadline = @post.deadline - DateTime.current
    end
  end

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    post = Post.find_by(id:params[:id])
    post.content = params[:content]
    post.deadline = params[:deadline]
    if post.save
      flash[:notice] = "内容を更新しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def delete
    post = Post.find_by(id:params[:id])
    post.delete
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

end
