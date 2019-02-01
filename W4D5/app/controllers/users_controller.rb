class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(email: params[:user][:email], password: params[:user][:password])
    if user.save
      login_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    render :show
  end

end