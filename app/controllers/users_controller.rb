class UsersController < ApplicationController
  # リソースを追加する(テーブルに新しいレコードを作成する)ためのフォームを作る
  def new
    @user = User.new
  end

  # リソースを作成する(テーブルに新しいレコードを作成する)
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: "アカウントを登録しました。"
    else
      render "new"
    end
  end

  # リソースの属性を表示する(レコードの内容を表示する)
  def show
    @user = User.find(params[:id])
  end

  # リソースを更新する(既存のレコードのカラムを更新する)ためのフォームを表示する
  def edit
    @user = User.find(params[:id])
  end

  # リソースを更新する(既存のレコードのカラムを更新する)
  def update

  end

  # リソースを削除する(テーブルからレコードを削除する)
  def destroy
    
  end
end
