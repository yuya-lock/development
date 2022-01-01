require 'rails_helper'

RSpec.describe "Posts", type: :system do
  # ユーザーが新規投稿を行う
  it "creates a new post" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.mail
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect {
      click_link "Check Here"
      click_link "投稿画面へ"
      fill_in "post[circle_name]", with: "SesSion"
      fill_in "post[university]", with: "早稲田大学"
      fill_in "post[body]", with: "example,example,example"
      click_button "投稿"

      expect(page).to have_content "早稲田大学"
      expect(page).to have_content "SesSion"
      expect(page).to have_content "example,example,example"
      expect(page).to have_content "編集"
      expect(page).to have_content "削除"
    }.to change(user.posts, :count).by(1)
  end
end
