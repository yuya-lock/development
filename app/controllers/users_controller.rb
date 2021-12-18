class UsersController < ApplicationController
  before_action :login_required

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

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to @user, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "#", notice: "アカウントを削除しました。"
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
