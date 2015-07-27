class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Sign up successful."
    else
      render "new"
    end
  end

  # call 'show' when user selects to view profile
  def show
  end

  # call 'edit' when user selects to edit profile
  def edit
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
