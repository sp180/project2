class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/users'
    else
      redirect_to '/signup'
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    id = params[:id]
    user = User.find(id)

    if user.update(user_params)
      redirect_to('/users')
    else
      redirect_to "users/#{id}/edit/"
    end
  end

  private

  def user_params
    params.require(:user).permit(
    :alias,
    :email,
    :password,
    :password_confirmation
    )
  end

end
