class UsersController < ApplicationController
  before_action :check_login , {except: [:new, :create, :login_form, :login]}
  before_action :check_user_user , {only: [:show, :edit, :update, :delete]}

  def new
    @user = User.new
  end

  def create
    @user = User.create(name:params[:name],
                        email:params[:email],
                        password:params[:password_digest],
                        img:"default_image.jpeg")
    @user.save
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録を完了しました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "ユーザー登録に失敗しました"
      render("users/new")
    end
  end

  def login_form

  end

  def login
    @user = User.find_by(email:params[:email])
    if @user && @user.authenticate(params[:password_digest])
      session[:user_id] = @user.id
      flash[:notice]
      redirect_to("/posts/index")
    else
      @error_message = "ログイン情報が正しくありません"
      @email = params[:email]
      @password_digest = params[:password_digest]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/users/login_form")
  end

  def show
    @user = User.find_by(id:params[:id])
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:img]
      @user.img = "#{@user.id}.jpg"
      img = params[:img]
      File.binwrite("public/user_image/#{@user.img}",img.read)
    end

    if  @user.save
      flash[:notice]= "ユーザー情報を保存しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def delete
    @user = User.find_by(id:params[:id])
    @user.delete
    session[:user_id] = nil
    redirect_to("/users/new")
  end

end
