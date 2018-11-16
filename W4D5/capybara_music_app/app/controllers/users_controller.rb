class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_url(user)
    else
      render json: ['Invalid Parameters for Sign Up!']
    end

  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
