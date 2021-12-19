class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, notice: "アカウントを登録しました。"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private def user_params
    attrs = [
      :name,
      :mail
    ]

    attrs << :password if params[:action] == "create"

    params.require(:user).permit(attrs)
  end
end