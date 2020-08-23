class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @articles = @user.articles
  end

  def new 
    @user = User.new
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "You have updated the account successfully!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username}! You have successfully signed up!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end