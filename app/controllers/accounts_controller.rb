class AccountsController < ApplicationController
  before_action :login_required

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(account_params)
    if @user.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @user = current.user
    @user.destroy
    redirect_to :root, notice: "アカウントを削除しました。"
  end

  private def account_params
    params.require(:account).permit(
      :name,
      :mail,
    )
  end
end
