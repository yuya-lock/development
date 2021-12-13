class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "名前とパスワードが一致しません"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
