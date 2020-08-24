class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def new 
    @user = User.new
  end

  def edit
  end
  
  def update
    if @user.update(users_params)
      flash[:notice] = "You have updated the account successfully!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}! You have successfully signed up!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @user
    end
  end
end