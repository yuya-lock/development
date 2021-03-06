class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to :root
    else
      flash.now[:danger] = "名前とパスワードが一致しません"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
